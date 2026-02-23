@extends('admin.body.adminmaster')

@section('admin')

<div class="container-fluid">
  <div class="row">
    <div class="col-md-12">
      <div class="white_shd full margin_bottom_30">

        <div class="full graph_head">
          <div class="heading1 margin_0 d-flex justify-content-between align-items-center">
            <h2>Banner List</h2>
            <button type="button"
                    class="btn btn-info"
                    data-toggle="modal"
                    data-target="#addBannerModal">
              Add Banner
            </button>
          </div>
        </div>

        <div class="table_section padding_infor_info">
          <div class="table-responsive-sm">
            <table class="table table-striped">
              <thead class="thead-dark">
                <tr>
                  <th>ID</th>
                  <th>Title</th>
                  <th>Image</th>
                  <th>Activity Image</th>
                  <th>Link</th>
                  <th>Active From</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                @foreach($banner as $item)
                <tr>
                  <td>{{ $item->id }}</td>
                  <td>{{ $item->title }}</td>
                  <td>
                    <img src="{{ $item->image }}" width="60">
                  </td>
                  <td>
                    <img src="{{ $item->activity_image }}" width="60">
                  </td>
                  <td>
                    {{ $item->link ?? '—' }}
                  </td>
                  <td>
                    {{ $item->active_from ?? 'Immediate' }}
                  </td>
                  <td>
                    <i class="fa fa-edit"
                       style="font-size:24px; cursor:pointer;"
                       data-toggle="modal"
                       data-target="#editBannerModal{{ $item->id }}"></i>

                    <a href="{{ route('banner.delete', $item->id) }}"
                       onclick="return confirm('Delete this banner?')">
                      <i class="fa fa-trash text-danger ml-2" style="font-size:24px;"></i>
                    </a>
                  </td>
                </tr>

                {{-- 🔁 EDIT MODAL --}}
                <div class="modal fade"
                     id="editBannerModal{{ $item->id }}"
                     tabindex="-1">
                  <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">

                      <div class="modal-header">
                        <h5 class="modal-title">Edit Banner</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                      </div>

                      <form action="{{ route('banner.update', $item->id) }}"
                            method="POST"
                            enctype="multipart/form-data">
                        @csrf

                        <div class="modal-body">
                          <div class="form-group">
                            <label>Title</label>
                            <input type="text"
                                   class="form-control"
                                   name="title"
                                   value="{{ $item->title }}">
                          </div>

                          <div class="form-group">
                            <label>Banner Link (Optional)</label>
                            <input type="text"
                                   class="form-control"
                                   name="link"
                                   value="{{ $item->link }}">
                          </div>

                          <div class="form-group">
                            <label>Active From</label>
                            <input type="datetime-local"
                                   class="form-control"
                                   name="active_from"
                                   value="{{ $item->active_from ? date('Y-m-d\TH:i', strtotime($item->active_from)) : '' }}">
                          </div>

                          <div class="form-group">
                            <label>Image</label>
                            <input type="file" name="image" class="form-control">
                          </div>

                          <div class="form-group">
                            <label>Activity Image</label>
                            <input type="file" name="activity_image" class="form-control">
                          </div>
                        </div>

                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                          <button type="submit" class="btn btn-primary">Update</button>
                        </div>

                      </form>
                    </div>
                  </div>
                </div>
                @endforeach
              </tbody>
            </table>
          </div>
        </div>

      </div>
    </div>
  </div>
</div>

{{-- ➕ ADD MODAL --}}
<div class="modal fade" id="addBannerModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title">Add Banner</h5>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <form action="{{ route('banner.store') }}"
            method="POST"
            enctype="multipart/form-data">
        @csrf

        <div class="modal-body">

          <div class="form-group">
            <label>Title</label>
            <input type="text" class="form-control" name="title" required>
          </div>

          <div class="form-group">
            <label>Banner Link (Optional)</label>
            <input type="text" class="form-control" name="link"
                   placeholder="https://example.com">
          </div>

          <div class="form-group">
            <label>Active From (Optional)</label>
            <input type="datetime-local" class="form-control" name="active_from">
            <small class="text-muted">
              Blank chhoda to banner turant active hoga
            </small>
          </div>

          <div class="form-group">
            <label>Image</label>
            <input type="file" class="form-control" name="image" required>
          </div>

          <div class="form-group">
            <label>Activity Image</label>
            <input type="file" class="form-control" name="activity_image" required>
          </div>

        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Add Banner</button>
        </div>

      </form>
    </div>
  </div>
</div>

@endsection
