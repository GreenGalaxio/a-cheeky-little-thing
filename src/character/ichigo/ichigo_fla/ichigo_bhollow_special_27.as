// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_bhollow_special_27

package ichigo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.geom.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
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

    public dynamic class ichigo_bhollow_special_27 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var chargeTime:*;
        public var damageCharged:Number;

        public function ichigo_bhollow_special_27()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 6, this.frame7, 12, this.frame13, 14, this.frame15, 17, this.frame18, 32, this.frame33, 41, this.frame42, 53, this.frame54, 60, this.frame61, 61, this.frame62, 68, this.frame69, 99, this.frame100, 110, this.frame111, 126, this.frame127);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "charging";
        }

        internal function frame2():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame7():*
        {
            this.xframe = "charging";
        }

        internal function frame13():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame15():*
        {
            this.xframe = "attack";
            this.self.playAttackSound(2);
            this.chargeTime = (this.self.getExecTime() - 7);
        }

        internal function frame18():*
        {
            this.self.playAttackSound(4);
        }

        internal function frame33():*
        {
            this.self.playVoiceSound(2);
        }

        internal function frame42():*
        {
            this.self.fireProjectile("blackgetsuga2");
            this.self.playAttackSound(4);
            this.damageCharged = (((21 * this.chargeTime) / 119) + 9);
            this.self.getCurrentProjectile().updateAttackBoxStats(1, {"damage":this.damageCharged});
        }

        internal function frame54():*
        {
            this.self.updateAttackBoxStats(1, {
                "power":4,
                "direction":60
            });
            this.self.refreshAttackID();
        }

        internal function frame61():*
        {
            this.self.endAttack();
        }

        internal function frame62():*
        {
            this.xframe = "attack2";
        }

        internal function frame69():*
        {
            this.self.playVoiceSound(3);
        }

        internal function frame100():*
        {
            this.self.playAttackSound(4);
            this.self.fireProjectile("blackgetsuga1");
            this.self.updateAttackBoxStats(1, {
                "power":4,
                "direction":60
            });
            this.self.refreshAttackID();
        }

        internal function frame111():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame127():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla

