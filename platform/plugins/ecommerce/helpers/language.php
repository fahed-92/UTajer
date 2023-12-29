<?php

use Botble\Base\Supports\Language;

if (!function_exists('get_langauge')) {
    /**
     * @param array $conditions
     * @param array $with
     * @param array $withCount
     * @return Collection
     */
    function get_langauge()
    {
        $languages = Language::getAvailableLocales();
        $lang = [];
        foreach($languages as $language){
            $lang[] = $language['name'];
        }
        return $lang;
    }
}

if (!function_exists('get_langauge_id')) {
    /**
     * @param array $conditions
     * @param array $with
     * @param array $withCount
     * @return Collection
     */
    function get_langauge_id()
    {
        $languages = Language::getAvailableLocales();
        $lang = [];
        foreach($languages as $language){
            $lang[] = $language['locale'];
        }
        return $lang;
    }
}
