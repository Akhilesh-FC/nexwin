<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Banner;
use Illuminate\Support\Facades\Storage;
use  Illuminate\Support\Facades\DB;

class BannerController extends Controller
{
    public function index()
    {
		 $banner = DB::select("SELECT * FROM `sliders` WHERE `status` = 1");

        return view('banner.index', compact('banner'));
    }
    
   public function banner_store(Request $request)
{
    $request->validate([
        'image' => 'required|image',
        'activity_image' => 'required|image',
        'title' => 'required',
        'link' => 'nullable|string',
        'active_from' => 'nullable|date'
    ]);

    $destinationPath = 'uploads/sliders';

    $imageName = time().'_'.$request->image->getClientOriginalName();
    $request->image->move(public_path($destinationPath), $imageName);

    $activityImageName = time().'_act_'.$request->activity_image->getClientOriginalName();
    $request->activity_image->move(public_path($destinationPath), $activityImageName);

    // 🔑 active_from logic
    $activeFrom = $request->active_from ?? now();

    DB::table('sliders')->insert([
        'title'          => $request->title,
        'image'          => url($destinationPath.'/'.$imageName),
        'activity_image' => url($destinationPath.'/'.$activityImageName),
        'link'           => $request->link,
        'active_from'    => $activeFrom,
        'status'         => 1,
        'created_at'     => now(),
        'updated_at'     => now(),
    ]);

    return redirect()->route('banner')->with('success','Banner added successfully');
}

    


    public function banner_update(Request $request, $id)
    {
        // Validate the incoming request data
        $request->validate([
            // 'title' => 'required|string|max:255',
            // 'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            // 'activity_image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);
    
        // Find the banner by ID or fail if not found
        $banner = Banner::findOrFail($id);
    
        // Initialize the data array with the title
        $data = [
    'title' => $request->title,
    'link' => $request->link,
    'active_from' => $request->active_from,
    'updated_at' => now()
];

    
        // Check if the image is present in the request
        if ($request->file('image')) {
            $file = $request->file('image');
            
            // Define the destination path within the public directory
            $destinationPath = 'uploads/sliders';
    
            // Create a unique filename for the image
            $fileName = time() . '_' . $file->getClientOriginalName();
    
            // Move the file to the desired location in the public directory
            $file->move(public_path($destinationPath), $fileName);
    
            // Generate the URL for the stored image
            $imageURL = url($destinationPath . '/' . $fileName);
    
            // Add the image URL to the data array
            $data['image'] = $imageURL;
        }
    
        // Check if the activity_image is present in the request
        if ($request->file('activity_image')) {
            $file = $request->file('activity_image');
            
            // Define the destination path within the public directory
            $destinationPath = 'uploads/activity_images';
    
            // Create a unique filename for the activity_image
            $fileName = time() . '_' . $file->getClientOriginalName();
    
            // Move the file to the desired location in the public directory
            $file->move(public_path($destinationPath), $fileName);
    
            // Generate the URL for the stored activity_image
            $activityImageURL = url($destinationPath . '/' . $fileName);
    
            // Add the activity_image URL to the data array
            $data['activity_image'] = $activityImageURL;
        }
    
        // Update the banner with the new data
        $banner->update($data);
    
        // Redirect to the banner route
        return redirect()->route('banner');
    }

    public function banner_delete($id)
    {
    
      $banner = Banner::find($id);
      $banner->delete();
      return redirect()->route('banner')
        ->with('success', 'Banner deleted successfully');
    }

 
}
