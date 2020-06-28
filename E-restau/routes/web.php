<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('index');
});
Route::get('/login', function () {
    return view('login');
});

Route::post('adminlogin','UserController@loginA');
Route::get('/dash','UserController@dashboard');
Route::get('/dashR','UserController@dashboardR');
Route::get('/readUser/{id_user}','UserController@readA');
Route::get('/createUser', function () {
    return view('createUser');
});
Route::post('/createU','UserController@createU');
Route::get('/deleteUser/{id_user}','UserController@deleteU');
Route::get('/updateUser/{id_user}','UserController@updateU');
Route::post('/editU/{id_user}','UserController@editU');

Route::post('/createR','UserController@createR');
Route::post('/createRe','UserController@createRe');
Route::get('/deleteRestaurant/{id_restaurant}','UserController@deleteR');
Route::get('/updateRestaurant/{id_restaurant}','UserController@updateR');
Route::post('/editR/{id_restaurant}','UserController@editR');
Route::post('/editRe/{id_restaurant}','UserController@editRe');

Route::get('/readRestaurant/{id_restaurant}','UserController@readR');
Route::get('/createRestaurant', function () {
    return view('createRestaurant');
});
Route::get('/readReservation/{id_Reservation}','UserController@readReservation');
Route::get('/deleteReservation/{id_Reservation}','UserController@deleteReservation');

Route::get('/readComment/{id}','UserController@readComment');
Route::get('/deleteComment/{id}','UserController@deleteComment');



