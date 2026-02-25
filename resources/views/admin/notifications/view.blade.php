@extends('admin.body.adminmaster')

@section('admin')
<div class="container mt-4">

    <h4>{{ $notification->title }}</h4>

    <div class="alert alert-info">
        {!! $notification->message !!}
    </div>

    <p>
        <strong>Created:</strong> {{ $notification->created_at }}
    </p>

    <a href="{{ route('admin.notifications') }}"
       class="btn btn-secondary">
        ← Back to Notifications
    </a>

</div>
@endsection
