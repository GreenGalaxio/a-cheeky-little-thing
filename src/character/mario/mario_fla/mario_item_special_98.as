// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_item_special_98

package mario_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
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
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class mario_item_special_98 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var itemBox:MovieClip;
        public var hitBox:MovieClip;
        public var hand:MovieClip;
        public var self:*;
        public var xframe:String;

        public function mario_item_special_98()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 7, this.frame8, 8, this.frame9, 11, this.frame12, 16, this.frame17, 23, this.frame24, 24, this.frame25, 28, this.frame29, 31, this.frame32, 32, this.frame33, 36, this.frame37, 45, this.frame46, 57, this.frame58, 88, this.frame89, 91, this.frame92, 96, this.frame97, 102, this.frame103, 106, this.frame107, 114, this.frame115);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
            };
        }

        internal function frame4():*
        {
            this.self.endAttack();
        }

        internal function frame5():*
        {
            this.xframe = "charging";
        }

        internal function frame8():*
        {
            gotoAndPlay("fan2");
        }

        internal function frame9():*
        {
            this.xframe = "attack";
        }

        internal function frame12():*
        {
            this.self.endAttack();
        }

        internal function frame17():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame24():*
        {
            this.self.endAttack();
        }

        internal function frame25():*
        {
            this.xframe = null;
        }

        internal function frame29():*
        {
            this.xframe = "charging";
        }

        internal function frame32():*
        {
            gotoAndPlay("beamsword2_charge");
        }

        internal function frame33():*
        {
            this.xframe = "attack";
        }

        internal function frame37():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame46():*
        {
            this.self.endAttack();
        }

        internal function frame58():*
        {
            this.self.endAttack();
        }

        internal function frame89():*
        {
            this.self.endAttack();
        }

        internal function frame92():*
        {
            this.self.getItem().shootProjectile(20, -15);
            this.self.playAttackSound(1);
        }

        internal function frame97():*
        {
            this.self.endAttack();
        }

        internal function frame103():*
        {
            if (((this.self.getItem().getItemStat("linkage_id") == "energytank") && (this.self.getDamage() > 0)))
            {
                this.gotoAndPlay("assistloop");
            };
        }

        internal function frame107():*
        {
            this.self.endAttack();
        }

        internal function frame115():*
        {
            this.self.endAttack();
        }


    }
}//package mario_fla

