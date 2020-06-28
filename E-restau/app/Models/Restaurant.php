<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Restaurant
 * 
 * @property int $id_restaurant
 * @property string $name
 * @property string $imagepath
 * @property string $category
 * @property float $discount
 * @property float $ratings
 * @property string $info
 * @property int $latitude
 * @property int $longitude
 * 
 * @property Collection|Avi[] $avis
 * @property Collection|Reservation[] $reservations
 *
 * @package App\Models
 */
class Restaurant extends Model
{
	protected $table = 'restaurant';
	protected $primaryKey = 'id_restaurant';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'discount' => 'float',
		'ratings' => 'float',
		'latitude' => 'int',
		'longitude' => 'int'
	];

	protected $fillable = [
		'name',
		'imagepath',
		'category',
		'discount',
		'ratings',
		'info',
		'latitude',
		'longitude'
	];

/*
	public function commentss()
	{
		return $this->hasMany(Reservation::class, 'name');
	}
*/}
