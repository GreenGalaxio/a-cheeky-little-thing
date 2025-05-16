package com.mcleodgaming.ssf2.controllers
{
    public class ItemSettings 
    {

        public static const FREQUENCY_OFF:int = 0;
        public static const FREQUENCY_VERY_LOW:int = 1;
        public static const FREQUENCY_LOW:int = 2;
        public static const FREQUENCY_MEDIUM:int = 3;
        public static const FREQUENCY_HIGH:int = 4;
        public static const FREQUENCY_VERY_HIGH:int = 5;
        public static const FREQUENCY_SUPER_HIGH:int = 6;
        public static const FREQUENCY_ULTRA_HIGH:int = 7;
        public static const FREQUENCY_MAX:int = 8;

        public var frequency:int;
        public var items:Object;

        public function ItemSettings()
        {
            this.frequency = ItemSettings.FREQUENCY_HIGH;
            this.items = {
                "smashball":true,
                "capsule":true,
                "capsule_ex":true,
                "fan":true,
                "beamsword":true,
                "homerunbat":true,
                "pokeball":true,
                "maximumtomato":true,
                "fooditem":true,
                "assistTrophy":true,
                "heartContainer":true,
                "energytank":true,
                "greenShell":true,
                "redShell":true,
                "spinyShell":true,
                "rayGun":true,
                "bobomb":true,
                "cucco":true,
                "mrsaturn":true,
                "explodingtag":true,
                "supermushroom":true,
                "poisonmushroom":true,
                "freezie":true,
                "bumper":true,
                "starrod":true,
                "pitfall":true
            };
        }

        public function setAllItemStatuses(_arg_1:Boolean):void
        {
            var _local_2:*;
            for (_local_2 in this.items)
            {
                this.items[_local_2] = _arg_1;
            };
        }

        public function exportSettings():Object
        {
            return ({
                "frequency":this.frequency,
                "items":{
                    "smashball":this.items.smashball,
                    "capsule":this.items.capsule,
                    "capsule_ex":this.items.capsule_ex,
                    "fan":this.items.fan,
                    "beamsword":this.items.beamsword,
                    "homerunbat":this.items.homerunbat,
                    "pokeball":this.items.pokeball,
                    "maximumtomato":this.items.maximumtomato,
                    "fooditem":this.items.fooditem,
                    "assistTrophy":this.items.assistTrophy,
                    "heartContainer":this.items.heartContainer,
                    "energytank":this.items.energytank,
                    "greenShell":this.items.greenShell,
                    "redShell":this.items.redShell,
                    "spinyShell":this.items.spinyShell,
                    "rayGun":this.items.rayGun,
                    "bobomb":this.items.bobomb,
                    "cucco":this.items.cucco,
                    "mrsaturn":this.items.mrsaturn,
                    "explodingtag":this.items.explodingtag,
                    "supermushroom":this.items.supermushroom,
                    "poisonmushroom":this.items.poisonmushroom,
                    "freezie":this.items.freezie,
                    "bumper":this.items.bumper,
                    "starrod":this.items.starrod,
                    "pitfall":this.items.pitfall
                }
            });
        }

        public function importSettings(_arg_1:Object):void
        {
            var _local_2:*;
            for (_local_2 in _arg_1)
            {
                if (this[_local_2] !== undefined)
                {
                    this[_local_2] = _arg_1[_local_2];
                }
                else
                {
                    trace((('You tried to set "' + _local_2) + "\" but it doesn't exist in the GameSetting class."));
                };
            };
        }


    }
}//package com.mcleodgaming.ssf2.controllers