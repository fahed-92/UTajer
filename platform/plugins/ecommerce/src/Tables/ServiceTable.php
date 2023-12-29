<?php

namespace Botble\Ecommerce\Tables;

use BaseHelper;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Ecommerce\Exports\ServiceExport;
use Botble\Ecommerce\Repositories\Interfaces\ServiceInterface;
use Botble\Ecommerce\Repositories\Interfaces\ProductInterface;
use Botble\Table\Abstracts\TableAbstract;
use Carbon\Carbon;
use Html;
use Illuminate\Contracts\Routing\UrlGenerator;
use Illuminate\Support\Facades\Auth;
use RvMedia;
use Yajra\DataTables\DataTables;

class ServiceTable extends TableAbstract
{
    /**
     * @var bool
     */
    protected $hasActions = true;

    /**
     * @var bool
     */
    protected $hasFilter = true;

    /**
     * @var string
     */
    protected $exportClass = ServiceExport::class;

    /**
     * ServiceTable constructor.
     * @param DataTables $table
     * @param ServiceInterface $serviceRepository
     */
    public function __construct(DataTables $table,UrlGenerator $urlGenerator, ServiceInterface $serviceRepository)
    {
        $this->repository = $serviceRepository;
        $this->setOption('id', 'table-vendor-products');
        parent::__construct($table, $urlGenerator);

    }

    /**
     * {@inheritDoc}
     */
    public function ajax()
    {
          $data = $this->table
            ->eloquent($this->query())
            ->editColumn('name', function ($item) {
                return Html::link(route('marketplace.vendor.services.edit', $item->id), $item->name);
            })
            // ->editColumn('image', function ($item) {
            //     if ($this->request()->input('action') == 'csv') {
            //         return RvMedia::getImageUrl($item->image, null, false, RvMedia::getDefaultImage());
            //     }
            //     if ($this->request()->input('action') == 'excel') {
            //         return RvMedia::getImageUrl($item->image, 'thumb', false, RvMedia::getDefaultImage());
            //     }
            //     return $this->displayServiceImage($item->image);
            // })
            ->editColumn('checkbox', function ($item) {
                return $this->getCheckbox($item->id);
            })
            ->editColumn('price', function ($item) {
                return $item->price;
            })

            ->editColumn('price_type', function ($item) {
                if ($item->price_type == 1)
                    return 'Fixed';
                else if ($item->price_type == 2)
                    return 'Hourly';
                else
                    return 'Not Defined';
            })

            ->editColumn('service_type', function ($item) {
                if ($item->service_type == 1)
                    return 'Individual';
                else if ($item->service_type == 2)
                    return 'Business';
                else
                    return 'Not Defined';
            })

            ->editColumn('created_at', function ($item) {
                return BaseHelper::formatDate($item->created_at);
            })
            ->editColumn('status', function ($item) {
                if ($item->status == 0)
                    return 'Inactive';
                else if ($item->status == 1)
                    return 'Active';
                else
                    return 'Not Available';
            })
            ->addColumn('operations', function ($item) {
                return view('plugins/marketplace::themes.dashboard.table.actions', [
                    'edit'   => 'marketplace.vendor.services.edit',
                    'delete' => 'marketplace.vendor.services.destroy',
                    'item'   => $item,
                ])->render();
            });
        return $this->toJson($data);
    }

    /**
     * {@inheritDoc}
     */
    public function query()
    {
        $query = $this->repository->getModel()
            ->select([
                'id',
                'name',
                'description',
                'availability',
                'status',
                // 'image',
                'service_type',
                'price',
                'price_type',
                'created_at',
            ])
            ->where('status', 1)
            ->where('user_id',auth('customer')->user()->id)
        ;

        return $this->applyScopes($query);
    }

    /**
     * {@inheritDoc}
     */
    public function htmlDrawCallbackFunction(): ?string
    {
        return parent::htmlDrawCallbackFunction() . '$(".editable").editable();';
    }

    /**
     * {@inheritDoc}
     */
    public function columns()
    {
        return [
            'id'           => [
                'title' => trans('core/base::tables.id'),
                'width' => '20px',
                'class' => 'hidden',
            ],
            // 'image'        => [
            //     'name'  => 'images',
            //     'title' => trans('plugins/ecommerce::products.image'),
            //     'width' => '100px',
            //     'class' => 'text-center',
            // ],
            'name'         => [
                'title' => trans('core/base::tables.name'),
                'class' => 'text-left',
            ],
            'price'        => [
                'title' => trans('plugins/ecommerce::products.price'),
                'class' => 'text-left',
            ],
            'price_type'        => [
                'title' => trans('plugins/ecommerce::products.price_type'),
                'class' => 'text-left',
            ],
            'service_type'        => [
                'title' => trans('plugins/ecommerce::products.service_type'),
                'class' => 'text-left',
            ],
            'created_at'   => [
                'title' => trans('core/base::tables.created_at'),
                'width' => '100px',
                'class' => 'text-center',
            ],
            'status'       => [
                'title' => trans('core/base::tables.status'),
                'width' => '100px',
                'class' => 'text-center',
            ],
        ];
    }

    /**
     * {@inheritDoc}
     */
    public function buttons()
    {
        return $this->addCreateButton(route('marketplace.vendor.services.create'));
    }

    /**
     * {@inheritDoc}
     */

    public function bulkActions(): array
    {
        return $this->addDeleteAction(route('marketplace.vendor.services.deletes'), null, parent::bulkActions());
    }

    /**
     * {@inheritDoc}
     */
    public function getBulkChanges(): array
    {
        return [
            'name'       => [
                'title'    => trans('core/base::tables.name'),
                'type'     => 'text',
                'validate' => 'required|max:120',
            ],
            'status'     => [
                'title'    => trans('core/base::tables.status'),
                'type'     => 'select',
                'choices'  => BaseStatusEnum::labels(),
                'validate' => 'required|in:' . implode(',', BaseStatusEnum::values()),
            ],
            'description'  => [
                'title'    => trans('plugins/ecommerce::products.category'),
                'type'     => 'text',
                'validate' => 'required',
            ],
            'created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'type'  => 'date',
            ],
        ];
    }

    /**
     * {@inheritDoc}
     */
    public function renderTable($data = [], $mergeData = [])
    {
        if ($this->query()->count() === 0 &&
            !$this->request()->wantsJson() &&
            $this->request()->input('filter_table_id') !== $this->getOption('id')
        ) {
            return view('plugins/ecommerce::services.intro');
        }

        return parent::renderTable($data, $mergeData);
    }

    /**
     * {@inheritDoc}
     */
    public function getDefaultButtons(): array
    {
        return [
            'export',
            'reload',
        ];
    }

    /**
     * @return array
     */
    public function getFilters(): array
    {
        $data = $this->getBulkChanges();

        return $data;
    }

    /**
     * {@inheritDoc}
     */
    public function applyFilterCondition($query, string $key, string $operator, ?string $value)
    {
        switch ($key) {
            case 'created_at':
                if (!$value) {
                    break;
                }

                $value = Carbon::createFromFormat(config('core.base.general.date_format.date'), $value)->toDateString();
                return $query->whereDate($key, $operator, $value);
        }

        return parent::applyFilterCondition($query, $key, $operator, $value);
    }

    /**
     * {@inheritDoc}
     */
    public function saveBulkChangeItem($item, string $inputKey, ?string $inputValue)
    {
        if ($inputKey === 'user') {
            $item->user()->sync([$inputValue]);

            return $item;
        }

        return parent::saveBulkChangeItem($item, $inputKey, $inputValue);
    }
}
