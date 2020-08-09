@extends('layouts.admin')
@section('title', 'Edit Language')

@section('content')

<div class="app-content content">
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="{{route('admin.dashboard')}}">الرئيسية</a>
                                </li>
                                <li class="breadcrumb-item">
                                    <a href="{{route('admin.languages')}}">اللغات</a>
                                </li>
                                <li class="breadcrumb-item active">تعديل اللغة</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-body">
                <!-- Basic form layout section start -->
                <section id="basic-form-layouts">
                    <div class="row match-height">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4
                                        class="card-title"
                                        id="basic-layout-form">تعديل اللغة</h4>
                                    <a class="heading-elements-toggle">
                                        <i class="la la-ellipsis-v font-medium-3"></i>
                                    </a>
                                    <div class="heading-elements">
                                        <ul class="list-inline mb-0">
                                            <li>
                                                <a data-action="collapse">
                                                    <i class="ft-minus"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a data-action="reload">
                                                    <i class="ft-rotate-cw"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a data-action="expand">
                                                    <i class="ft-maximize"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a data-action="close">
                                                    <i class="ft-x"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                @include('admin.includes.alerts.success')
                                @include('admin.includes.alerts.errors')

                                <div class="card-content collapse show">
                                    <div class="card-body">
                                        <form
                                            class="form"
                                            action="{{route('admin.language.update', $lang->id)}}"
                                            method="post"
                                            enctype="multipart/form-data">

                                            @csrf
                                            
                                            <div class="form-body">
                                                <h4 class="form-section">
                                                    <i class="ft-home"></i>
                                                    <span>تفاصيل اللغه</span>
                                                </h4>

                                                <div class="row">

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="lang-name">الاسم</label>
                                                            <input
                                                                type="text"
                                                                value="{{old('name', $lang->name)}}"
                                                                id="lang-name"
                                                                name="lang-name"
                                                                class="form-control"
                                                                placeholder="ادخل اسم اللغة" />

                                                            @error('lang-name')
                                                                <span class="text-danger">{{$message}}</span>
                                                            @enderror
                                                            
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="lang-abbr">الاختصار</label>
                                                            <input
                                                                type="text"
                                                                value="{{old('abbr', $lang->abbr)}}"
                                                                id="lang-abbr"
                                                                name="lang-abbr"
                                                                class="form-control"
                                                                placeholder="ادخل اختصار اللغة" />

                                                            @error('lang-abbr')
                                                                <span class="text-danger">{{$message}}</span>
                                                            @enderror
                                                            
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="lang-dire">الاتجاة</label>
                                                            <select
                                                                id="lang-dire"
                                                                name="lang-dire"
                                                                class="custom-select custom-select-lg">

                                                                <optgroup label="من فضلك أختر اتجاه اللغة">
                                                                    <option
                                                                        value="rtl"
                                                                        {{(old('direction', $lang->direction) == 'rtl')? 'selected': ''}}>
                                                                        
                                                                        <span>من اليمين الي اليسار</span>
                                                                    </option>
                                                                
                                                                    <option
                                                                        value="ltr"
                                                                        {{(old('direction', $lang->direction) == 'ltr')? 'selected': ''}}>
                                                                        
                                                                        <span>من اليسار الي اليمين</span>
                                                                    </option>
                                                                </optgroup>
                                                            </select>

                                                            @error('lang-dire')
                                                                <span class="text-danger">{{$message}}</span>
                                                            @enderror
                                                            
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group mt-1 text-center pt-1">
                                                            <input
                                                                type="checkbox"
                                                                name="lang-stat"
                                                                id="switcheryColor4"
                                                                value="1"
                                                                class="switchery"
                                                                data-color="success"
                                                                @if (old('status', $lang->status) == 1) checked @endif />
                                                            
                                                            <label
                                                                style="margin-top: 10px"
                                                                for="switcheryColor4"
                                                                class="card-title ml-1">الحالة</label>

                                                            @error('lang-stat')
                                                                <div>
                                                                    <span class="text-danger">{{$message}}</span>
                                                                </div>
                                                            @enderror

                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    {{-- <div class="col-md-6">
                                                        <div class="form-group mt-1">
                                                            <input
                                                                type="checkbox"
                                                                name="lang-stat"
                                                                id="switcheryColor4"
                                                                value="1"
                                                                class="switchery"
                                                                data-color="success"
                                                                @if (old('status', $lang->status) == 1) checked @endif />
                                                            <label
                                                                for="switcheryColor4"
                                                                class="card-title ml-1">الحالة</label>

                                                            @error('lang-stat')
                                                                <div>
                                                                    <span class="text-danger">{{$message}}</span>
                                                                </div>
                                                            @enderror

                                                        </div>
                                                    </div> --}}
                                                </div>
                                            </div>


                                            <div class="form-actions">
                                                <button
                                                    type="button"
                                                    class="btn btn-warning mr-1"
                                                    onclick="history.back();">
                                                    
                                                    <i class="ft-x"></i>
                                                    <span>تراجع</span>
                                                </button>

                                                <button
                                                    type="submit"
                                                    class="btn btn-primary">

                                                    <i class="la la-check-square-o"></i>
                                                    <span>تحديث</span>
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- // Basic form layout section end -->
            </div>
        </div>
    </div>

@endsection