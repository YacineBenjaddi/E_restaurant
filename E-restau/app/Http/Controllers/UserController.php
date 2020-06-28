<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Restaurant;
use App\Models\Reservation;
use App\Models\Comments;
use Illuminate\Http\Request;
use Illuminate\Hashing\BcryptHasher;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
   /*  public function dashboardA(){
      $admins = Admin::all();
      return view('dashboard',['admins'=>$admins]);

    }*/

    public function loginA(Request $request){

$validator = Validator::make($request->all(),[
       
       'email'=>'required',
       'password'=>'required',]);
    
    if ($validator->fails()) {
        return array(
         'error'=>true,
         'message'=>$validator->errors()->all()
        );
    }

$admin = User::where('email',$request->input('email'))->first();
if(count((array)$admin)){

    if (($request->input('password')==$admin->password)) {

        unset($admin->password);
         if ('User'==$admin->profile) {
        //return redirect('/dashboardadmin');
     //   return array('error'=>false,'admin'=>$admin);
        return redirect('/dash');}
        else{return array('error'=>true,'message'=>'profil not allowed');}
    }
    else{

        return array('error'=>true,'message'=>'invalid password');
    }
}else{
    return array('error'=>true,'message'=>'User not found');
}

}
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function dashboard()
    {
        //
      $admins = User::all();
         $restaurants = Restaurant::all();
           $reservations = Reservation::all();

       // echo "$reservations";
          //$admins = Admin::all();
     return view('dashboard',['restaurants'=>$restaurants],['admins'=>$admins]);

    }

     public function dashboardR()
    {
        //
      
           $reservations = Reservation::all();
           $comments = Comments::all();
       // echo "$reservations";
          //$admins = Admin::all();
     return view('dashboardR',['reservations'=>$reservations],['comments'=>$comments]);

    }

    public function readA($id_user){
        $admins = User::find($id_user);
        //return $id;
        return view('readUser',['admins'=>$admins]);
        
    }
     public function createU(Request $request){
    $validator = Validator::make($request->all(),[
       'last_name'=>'required',
       'first_name'=>'required',
       'email'=>'required|unique:user',
       'password'=>'required|min:6',
       'profile'=>'required']);
    
    if ($validator->fails()) {
        return array(
         'error'=>true,
         'message'=>$validator->errors()->all()
        );
    }

    $admin=new User();
    $admin->last_name=$request->input('last_name');
    $admin->first_name=$request->input('first_name');
    $admin->email=$request->input('email');
    $admin->password=$request->input('password');
    $admin->profile=$request->input('profile');

    $admin->save();

    unset($admin->password);

    return redirect('/dash');

  }


public function deleteU($id_user){
    User::where('id_user',$id_user)
    ->delete();
    return redirect('/dash');
    }

 public function editU(Request $request, $id_user){
      
        $validator = Validator::make($request->all(),[
       'last_name'=>'required',
       'first_name'=>'required',
       'email'=>'required|unique:user',
       'password'=>'required|min:6',
       'profile'=>'required']);

        $data = array(
       'last_name'=>$request->input('last_name'),
       'first_name'=>$request->input('first_name'),
       'email'=>$request->input('email'),
       'password'=>$request->input('password'),
       'profile'=>$request->input('profile'),
        );
        User::where('id_user',$id_user)
        ->update($data);
        return redirect('/dash');
         
    } 

 public function updateU($id_user){
        $users = User::find($id_user);
        return view('editUser',['users'=>$users]);
        /* check 
        echo '<pre>';
        print_r($articles);
        echo "</pre>";
        exit();*/       
    } 

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        //
    }
    
    //=======================Restaurant ==================

     public function readR($id_restaurant){
        $restaurants = Restaurant::find($id_restaurant);


        //return $id;
        return view('readRestaurant',['restaurants'=>$restaurants]);
        
    }
     public function createR(Request $request){
    $validator = Validator::make($request->all(),[
       'name'=>'required',
       'imagepath'=>'required',
       'category'=>'required',
       'discount'=>'required',
       'ratings'=>'required',
   	   'info'=>'required',
   	   'latitude'=>'required',
   	   'longitude'=>'required']);
    
    if ($validator->fails()) {
        return array(
         'error'=>true,
         'message'=>$validator->errors()->all()
        );
    }

    $restaurant=new Restaurant();
   $restaurant->name=$request->input('name');
    $restaurant->imagepath=$request->input('imagepath');
    $restaurant->category=$request->input('category');
    $restaurant->discount=$request->input('discount');
    $restaurant->ratings=$request->input('ratings');
     $restaurant->info=$request->input('info');
      $restaurant->latitude=$request->input('latitude');
       $restaurant->longitude=$request->input('longitude');

    $restaurant->save();

    //($restaurant->name);

    return redirect('/dash');

  }
//======================== Create restaurant with image ==========================
  //<form class="form-horizontal" enctype="multipart/form-data" method="post" action="{{ url('/createRe')}} ">
public function createRe(Request $request){
   
    $restaurant=new Restaurant();
  $restaurant->name=$request->input('name');
 /* if ($request->hasFile('imagepath')){
         $file = $request->file('imagepath');
        $extension = $file->getClientOriginalExtension();
        $filename = time() . "." . $extension;
        $file->move('restaurant/images/', $filename);
        $restaurant->imagepath=$filename;
      }else{
        return $request;

           $restaurant->imagepath='';
      }
*/
      if ($request->hasFile('imagepath')) {
    $filename = $request->file('imagepath')->getClientOriginalName();
    $restaurant->imagepath="assets/images/$filename";
        }

    //$restaurant->imagepath=$request->input('imagepath');
    $restaurant->category=$request->input('category');
    $restaurant->discount=$request->input('discount');
    $restaurant->ratings=$request->input('ratings');
     $restaurant->info=$request->input('info');
      $restaurant->latitude=$request->input('latitude');
       $restaurant->longitude=$request->input('longitude');

    $restaurant->save();

    //($restaurant->name);

    return redirect('/dash');

  }
//======================== end create ===========================================

public function deleteR($id_restaurant){
    Restaurant::where('id_restaurant',$id_restaurant)
    ->delete();
    return redirect('/dash');
    }

 public function editR(Request $request, $id_restaurant){
      
        $validator = Validator::make($request->all(),[
       'name'=>'required|unique:restaurant',
       'imagepath'=>'required',
       'category'=>'required',
       'discount'=>'required',
       'ratings'=>'required',
   	   'info'=>'required',
   	   'latitude'=>'required',
   	   'longitude'=>'required']);

        $data = array(
       'name'=>$request->input('name'),
       'imagepath'=>$request->input('imagepath'),
       
        //'imagepath'="assets/images/imagepath",
        
       'category'=>$request->input('category'),
       'discount'=>$request->input('discount'),
       'ratings'=>$request->input('ratings'),
       'info'=>$request->input('info'),
       'latitude'=>$request->input('latitude'),
        'longitude'=>$request->input('longitude'),
        );
        Restaurant::where('id_restaurant',$id_restaurant)
        ->update($data);
        return redirect('/dash');
         
    } 

 public function updateR($id_restaurant){
        $restaurants = Restaurant::find($id_restaurant);
        return view('editRestaurant',['restaurants'=>$restaurants]);
        /* check 
        echo '<pre>';
        print_r($articles);
        echo "</pre>";
        exit();*/       
    } 


    //======================== Update and edit restaurant ==============================
public function editRe(Request $request, $id_restaurant){
   $restaurant = Restaurant::find($id_restaurant);

  $restaurant->name=$request->input('id_restaurant');
     if ($request->hasFile('imagepath')) {
    $filename = $request->file('imagepath')->getClientOriginalName();
    $restaurant->imagepath="assets/images/$filename";
        }
   $restaurant->name=$request->input('name');
    //$restaurant->imagepath=$request->input('imagepath');
    $restaurant->category=$request->input('category');
    $restaurant->discount=$request->input('discount');  
    $restaurant->ratings=$request->input('ratings');
     $restaurant->info=$request->input('info');
      $restaurant->latitude=$request->input('latitude');
       $restaurant->longitude=$request->input('longitude');

    $restaurant->save();

    //($restaurant->name);

    return redirect('/dash');


    //($restaurant->name);

   // return redirect('/dash');
   /* check 
        echo '<pre>';
        print_r($restaurants);
        echo "</pre>";
        exit();  */

  }

  //=========================== read reservation ====================================

 public function readReservation($id_Reservation){
        $reservations = Reservation::find($id_Reservation);
        //return $id;
        return view('readReservation',['reservations'=>$reservations]);
        
      //=========================== end read reservation ================================

}

public function deleteReservation($id_Reservation){
    Reservation::where('id_Reservation',$id_Reservation)
    ->delete();
    return redirect('/dashR');
    }


    public function readComment($id){
        $comments = Comments::find($id);
        //return $id;
        return view('readComment',['comments'=>$comments]);
        
      //=========================== end read reservation ================================

}

public function deleteComment($id){
    Comments::where('id',$id)
    ->delete();
    return redirect('/dashR');
    }

}
