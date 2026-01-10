{{
    config(
        materialized = 'ephemeral',
    )
}}

With listings as (
    Select Listing_ID, Property_type, Room_type,City, Country,PRICE_PER_NIGHT_TAG, LISTINGS_CREATED_AT
    From {{ ref ('obt')}}
)
Select* from listings