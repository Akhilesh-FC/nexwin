@extends('admin.body.adminmaster')

@section('admin')

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="white_shd full margin_bottom_30">

                {{-- Header --}}
                <div class="full graph_head">
                    <div class="heading1 margin_0 d-flex justify-content-between align-items-center">
                        <h2>OTP Pack History</h2>

                        {{-- Per page dropdown --}}
                        <form method="GET">
                            <select name="per_page" class="form-control"
                                    onchange="this.form.submit()">
                                <option value="10" {{ $perPage == 10 ? 'selected' : '' }}>10</option>
                                <option value="25" {{ $perPage == 25 ? 'selected' : '' }}>25</option>
                                <option value="50" {{ $perPage == 50 ? 'selected' : '' }}>50</option>
                                <option value="100" {{ $perPage == 100 ? 'selected' : '' }}>100</option>
                            </select>
                        </form>
                    </div>
                </div>

                {{-- Table --}}
                <div class="table_section padding_infor_info">
                    <div class="table-responsive-sm">
                        <table class="table table-bordered table-striped">
                            <thead class="thead-dark">
                                <tr>
                                    <th>#</th>
                                   
                                    <th>Mobile Number</th>
                                    <th>Used At</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($history as $key => $row)
                                    <tr>
                                        <td>{{ $history->firstItem() + $key }}</td>
                                        
                                        <td>{{ $row->mobile }}</td>
                                        <td>{{ date('d-m-Y h:i A', strtotime($row->used_at)) }}</td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="4" class="text-center text-danger">
                                            No OTP Pack History Found
                                        </td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>

                    {{-- Pagination info + links --}}
                    <div class="d-flex justify-content-between align-items-center mt-3">
                        <div>
                            Showing
                            {{ $history->firstItem() }}
                            to
                            {{ $history->lastItem() }}
                            of
                            {{ $history->total() }}
                            entries
                        </div>

                        <div>
                            {{ $history->links('pagination::bootstrap-4') }}
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>

@endsection
