<?php

namespace Botble\Ecommerce\Tables;

use BaseHelper;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Ecommerce\Exports\ServiceExport;
use Botble\Ecommerce\Models\ServiceBooking;
use Botble\Ecommerce\Repositories\Interfaces\BookedServiceInterface;
use Botble\Ecommerce\Repositories\Interfaces\ServiceInterface;
use Botble\Ecommerce\Repositories\Interfaces\ProductInterface;
use Botble\Table\Abstracts\TableAbstract;
use Carbon\Carbon;
use Html;
use Illuminate\Contracts\Routing\UrlGenerator;
use Illuminate\Support\Facades\Auth;
use RvMedia;
use Yajra\DataTables\DataTables;

class BookedServiceTable extends TableAbstract
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
     * ServiceTable constructor.
     * @param DataTables $table
     * @param ServiceInterface $serviceRepository
     */
    public function __construct(DataTables $table,UrlGenerator $urlGenerator, BookedServiceInterface $serviceRepository)
    {
        $this->repository = $serviceRepository;
        $this->setOption('id', 'table-vendor-services');
        parent::__construct($table, $urlGenerator);

    }

    /**
     * {@inheritDoc}
     */
    public function ajax()
    {
        $data = $this->table
            ->eloquent($this->query())
//            ->editColumn('image', function ($item) {
//                if ($this->request()->input('action') == 'csv') {
//                    return RvMedia::getImageUrl($item->image, null, false, RvMedia::getDefaultImage());
//                }
//                if ($this->request()->input('action') == 'excel') {
//                    return RvMedia::getImageUrl($item->image, 'thumb', false, RvMedia::getDefaultImage());
//                }
//                return $this->displayServiceImage($item->service->image);
//            })
            ->editColumn('customer', function ($item) {
                return $item->customer->name;
            })
            ->editColumn('service', function ($item) {
                if ($item->service)
                    return $item->service->name;
                else
                    return $item->service_id;
            })
            ->editColumn('checkbox', function ($item) {
                return $this->getCheckbox($item->id);
            })
            ->editColumn('price', function ($item) {
                return $item->sub_total;
            })

            ->editColumn('date', function ($item) {
                return $item->date;
            })

            ->editColumn('created_at', function ($item) {
                return BaseHelper::formatDate($item->created_at);
            })
            ->editColumn('status', function ($item) {
                return $item->status;
            })
            ->addColumn('operations', function ($item) {
                return view('plugins/marketplace::themes.dashboard.table.actions', [
                    'edit'   => 'marketplace.vendor.booked-services.edit',
                    'complete' => 'marketplace.vendor.booked-services.complete',
//                    'delete' => 'marketplace.vendor.booked-services.destroy',
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
                'user_id',
                'service_id',
                'created_at',
                'sub_total',
                'date',
                'status',
            ])
            ->with(['customer','service'])
            ->where('status','!=',ServiceBooking::DELETED_STATUS)
//            ->where('status','!=',ServiceBooking::CLOSE_STATUS)
//            ->where('user_id',auth('customer')->id())
            ->whereHas('service',function ($q){
                $q->where('user_id',auth('customer')->id());
            })
            ->orderBy('id','DESC')
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
//            'image'        => [
//                'title' => trans('core/base::tables.image'),
//                'class' => 'text-left',
//            ],
            'customer'         => [
                'title' => trans('core/base::tables.name'),
                'class' => 'text-left',
            ],
            'service'        => [
                'title' => trans('core/base::tables.service_id'),
                'class' => 'text-left',
            ],
            'price'        => [
                'title' => trans('core/base::tables.price'),
                'class' => 'text-left',
            ],
            'date'   => [
                'title' => trans('core/base::tables.date'),
                'width' => '100px',
                'class' => 'text-center',
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
//        return $this->addCreateButton(route('marketplace.vendor.booked-services.create'));
    }

    /**
     * {@inheritDoc}
     */

    public function bulkActions(): array
    {
        return $this->addDeleteAction(route('marketplace.vendor.booked-services.deletes'), null, parent::bulkActions());
    }

    /**
     * {@inheritDoc}
     */
    public function getBulkChanges(): array
    {
        return [
            'user_id'       => [
                'title'    => trans('core/base::tables.user_id'),
                'type'     => 'text',
                'validate' => 'required|max:120',
            ],
            'service_id'  => [
                'title'    => trans('core/base::tables.service_id'),
                'type'     => 'text',
                'validate' => 'required',
            ],
            'status'     => [
                'title'    => trans('core/base::tables.status'),
                'type'     => 'select',
                'choices'  => BaseStatusEnum::labels(),
                'validate' => 'required|in:' . implode(',', BaseStatusEnum::values()),
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
            return view('plugins/ecommerce::service-booking.intro');
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
