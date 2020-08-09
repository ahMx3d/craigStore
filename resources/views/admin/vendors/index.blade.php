@extends('layouts.admin')

@section('title', 'Vendors')

@section('content')

<div class="app-content content">
    <div class="content-wrapper">
        <div class="content-header row">
            <div class="content-header-left col-md-6 col-12 mb-2">
                <h3 class="content-header-title">المتاجر</h3>
                <div class="row breadcrumbs-top">
                    <div class="breadcrumb-wrapper col-12">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="{{route('admin.dashboard')}}">الرئيسيه</a>
                            </li>
                            <li class="breadcrumb-item active">
                                <a href="{{route('admin.vendors')}}">المتاجر</a>
                            </li>
                            <li class="breadcrumb-item active">
                                <a href="{{route('admin.vendor.create')}}">اضافة متجر جديد</a>
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div class="content-body">
            <!-- DOM - jQuery events table -->
            <section id="dom">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">متاجر الموقع </h4>
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
                                <div class="card-body card-dashboard" style="overflow-x: auto;">
                                <table class="table table-responsive display nowrap table-striped table-bordered{{--  scroll-horizontal --}}">
                                        <thead>
                                        <tr>
                                            <th class="text-center">الاسم</th>
                                            <th class="text-center">الشعار</th>
                                            <th class="text-center">الحاله</th>
                                            <th class="text-center">التليفون</th>
                                            <th class="text-center">القسم</th>
                                            <th class="text-center">الإجراءات</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        {{-- DB LANGUAGES --}}
                                        @isset($vendors)
                                            @foreach($vendors as $vendor)
                                            
                                                <tr>
                                                    <td class="text-center">{{$vendor->name}}</td>
                                                    <td class="text-center">
                                                        <img
                                                            style="width: 100%; height:100%;"
                                                            src="{{$vendor->logo}}"
                                                            alt="Category Image" />
                                                    </td>
                                                    <td class="text-center">{{$vendor->getStatus()}}</td>
                                                    <td class="text-center">{{$vendor->mobile}}</td>
                                                    <td class="text-center">{{$vendor->category->name}}</td>
                                                    <td class="text-center">
                                                        <div
                                                            class="btn-group"
                                                            role="group"
                                                            aria-label="Basic example">
                                                            
                                                            <a
                                                                href="{{route('admin.vendor.edit', $vendor->id)}}"
                                                                class="btn btn-outline-primary btn-min-width box-shadow-3 mr-1 mb-1">
                                                                
                                                                <span>تعديل</span>
                                                            </a>
                                                            
                                                            <a
                                                                href=""
                                                                class="btn btn-outline-warning btn-min-width box-shadow-3 mr-1 mb-1">
                                                            
                                                                <span>تفعيل</span>
                                                            </a>

                                                            <a
                                                                href="{{route('admin.vendor.delete', $vendor->id)}}"
                                                                class="btn btn-outline-danger btn-min-width box-shadow-3 mr-1 mb-1">
                                                            
                                                                <span>حذف</span>
                                                            </a>

                                                        </div>
                                                    </td>
                                                </tr>
                                            @endforeach

                                            {!! $vendors->links() !!}

                                        @endisset
                                        
                                        </tbody>
                                    </table>
                                    <div class="justify-content-center d-flex">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>

@endsection