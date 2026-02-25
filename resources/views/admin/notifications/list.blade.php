@extends('admin.body.adminmaster')

@section('admin')
<div class="container mt-4">
    <h4>Admin Notifications</h4>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>Title</th>
                <th>Status</th>
                <th>Date</th>
            </tr>
        </thead>

        <tbody>
        @foreach($notifications as $key => $n)
            <tr class="{{ $n->status == 0 ? 'table-warning' : '' }}">
                <td>{{ $key + 1 }}</td>

                <td>
                    <a href="{{ route('admin.notification.view', $n->id) }}">
                        {{ $n->title }}
                    </a>
                </td>

                <td>
                    {{ $n->status == 0 ? 'Unread' : 'Read' }}
                </td>

                <td>{{ $n->created_at }}</td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>
@endsection
