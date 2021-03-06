<?php

namespace App\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Vendor extends Model
{
    // NOTIFICATION CLASS
    use Notifiable;

    // MODEL TABLE NAME IN DB;
    protected $table = 'vendors';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    
    protected $fillable = [
        'name',
        'logo',
        'mobile',
        'password',
        'address',
        'email',
        'cate_id',
        'status',
        'latitude',
        'longitude',
        'created_at',
        'updated_at',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */

    protected $hidden = [
        'password',
        'cate_id',
        'created_at',
        'updated_at'
    ];

    // LOCAL ACTIVE SCOPE
    public function scopeActive($query)
    {
        return $query->where(
            'status',
            '=',
            1
        );
    }
    
    // LOCAL SELECT SCOPE
    public function scopeSelection($query)
    {
        return $query->select(
            'id',
            'name',
            'logo',
            'mobile',
            'address',
            'email',
            'cate_id',
            'status',
            'latitude',
            'longitude'
        );
    }

    // LOGO ACCESSOR
    public function getLogoAttribute($val)
    {
        // SHOW THE SERVER IMAGE ROUTE INSIDE HTML IMAGE TAG
        return ($val != null)? asset('assets/'.$val): '';
    }

    // STATUS METHOD
    public function getStatus()
    {
        // DISPLAY ACTIVE FOR ONE AND PENDING FOR ZERO
        return ($this->status == 1)? 'Active': 'Pending';
    }

    // PASSWORD MUTATOR
    public function setPasswordAttribute($val)
    {
        // NOT EMPTY CHECK
        if (!empty($val)) {
            
            // RETURN THE HASHED PASSWORD TO THE DATABASE
            $this->attributes['password'] = bcrypt($val);
        }
        
    }

    // VENDORS RELATIONSHIP WITH MAIN CATEGORIES
    public function category()
    {
        // RETURN THE RELATED CATEGORY
        return $this->belongsTo(
            MainCate::class,
            'cate_id',
            'id'
        );
    }

}
