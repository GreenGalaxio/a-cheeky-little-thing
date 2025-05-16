// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//marth_fla.marth_nspec_80

package marth_fla
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

    public dynamic class marth_nspec_80 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox:MovieClip;
        public var attackBox2:MovieClip;
        public var self:*;
        public var xframe:String;
        public var blah:Number;
        public var damage:*;
        public var tipperDamage:*;
        public var shieldDamage:*;
        public var chargetime:*;

        public function marth_nspec_80()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6, 12, this.frame13, 13, this.frame14, 15, this.frame16, 30, this.frame31);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
        }

        internal function frame5():*
        {
            this.blah = SSF2API.playSound("marth_nspec_charge");
        }

        internal function frame6():*
        {
            this.xframe = "charging";
        }

        internal function frame13():*
        {
            gotoAndPlay("charging");
        }

        internal function frame14():*
        {
            this.xframe = "attack";
            this.damage = this.self.getAttackBoxStat(1, "damage");
            this.tipperDamage = this.self.getAttackBoxStat(2, "damage");
            this.shieldDamage = this.self.getAttackBoxStat(1, "shieldDamage");
            this.chargetime = this.self.getAttackStat("chargetime");
            this.damage = (this.damage + (this.chargetime * 0.2));
            this.tipperDamage = (this.tipperDamage + (this.chargetime * 0.2));
            this.shieldDamage = (this.shieldDamage + (this.chargetime * 0.2));
            this.self.updateAttackBoxStats(1, {
                "damage":this.damage,
                "shieldDamage":this.shieldDamage
            });
            this.self.updateAttackBoxStats(2, {
                "damage":this.tipperDamage,
                "shieldDamage":this.shieldDamage
            });
            if (!this.self.isOnGround())
            {
                this.self.setXSpeed((Math.abs(this.self.getXSpeed()) + (this.chargetime * 0.4)), false);
            };
            SSF2API.stopSound(this.blah);
        }

        internal function frame16():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame31():*
        {
            this.self.endAttack();
        }


    }
}//package marth_fla

