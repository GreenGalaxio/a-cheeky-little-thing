// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_finalsmash_92

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.globalization.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.xml.*;

    public dynamic class kirby_finalsmash_92 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var range:MovieClip;
        public var self:*;
        public var item:Array;
        public var randomItem:String;

        public function kirby_finalsmash_92()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 21, this.frame22, 33, this.frame34, 45, this.frame46, 54, this.frame55, 88, this.frame89, 100, this.frame101, 125, this.frame126, 144, this.frame145, 156, this.frame157, 163, this.frame164, 166, this.frame167, 177, this.frame178, 178, this.frame179, 185, this.frame186, 190, this.frame191, 194, this.frame195, 204, this.frame205);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.item = new Array();
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playVoiceSound(1);
                SSF2API.playSound("kirby_fsdestroy");
            };
        }

        internal function frame8():*
        {
            SSF2API.playSound("kirby_fsbg");
        }

        internal function frame22():*
        {
            SSF2API.playSound("kirby_fryingpan");
        }

        internal function frame34():*
        {
            SSF2API.playSound("kirby_fryingpan");
        }

        internal function frame46():*
        {
            SSF2API.playSound("kirby_jump1");
        }

        internal function frame55():*
        {
            SSF2API.playSound("Kirby_Cooking");
        }

        internal function frame89():*
        {
            SSF2API.playSound("kirby_fssalt");
            SSF2API.playSound("Kirby_Cooking");
        }

        internal function frame101():*
        {
            SSF2API.playSound("kirby_fssalt");
        }

        internal function frame126():*
        {
            SSF2API.playSound("Kirby_Cooking");
        }

        internal function frame145():*
        {
            SSF2API.playSound("kirby_fssalt");
        }

        internal function frame157():*
        {
            SSF2API.playSound("kirby_fssalt");
        }

        internal function frame164():*
        {
            this.self.updateAttackBoxStats(1, {
                "hasEffect":true,
                "hitLag":-10
            });
        }

        internal function frame167():*
        {
            SSF2API.playSound("kirby_jump1");
        }

        internal function frame178():*
        {
            SSF2API.playSound("splash_char");
            this.self.updateAttackBoxStats(1, {
                "hasEffect":true,
                "hitStun":-1
            });
            this.self.refreshAttackID();
        }

        internal function frame179():*
        {
            this.self.releaseOpponent();
            this.item.push("cucco");
            this.item.push("beamsword");
            this.item.push("bobomb");
            this.item.push("mrsaturn");
            this.item.push("capsule");
            this.item.push("capsule_ex");
            this.item.push("fooditem");
            this.item.push("maximumtomato");
            this.item.push("heartContainer");
            this.item.push("energytank");
            this.item.push("bumper");
            this.item.push("explodingtag");
            this.item.push("fan");
            this.item.push("greenshell");
            this.randomItem = this.item[Math.round((SSF2API.random() * (this.item.length - 1)))];
            this.self.generateItem(this.randomItem, false, false);
            this.randomItem = this.item[Math.round((SSF2API.random() * (this.item.length - 1)))];
            this.self.generateItem(this.randomItem, false, false);
            this.randomItem = this.item[Math.round((SSF2API.random() * (this.item.length - 1)))];
            this.self.generateItem(this.randomItem, false, false);
        }

        internal function frame186():*
        {
            this.randomItem = this.item[Math.round((SSF2API.random() * (this.item.length - 1)))];
            this.self.generateItem(this.randomItem, false, false);
        }

        internal function frame191():*
        {
            this.randomItem = this.item[Math.round((SSF2API.random() * (this.item.length - 1)))];
            this.self.generateItem(this.randomItem, false, false);
        }

        internal function frame195():*
        {
            SSF2API.playSound("kirby_fsdestroy");
        }

        internal function frame205():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

