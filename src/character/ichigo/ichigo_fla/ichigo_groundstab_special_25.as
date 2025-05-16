// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_groundstab_special_25

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

    public dynamic class ichigo_groundstab_special_25 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var chargeTime:*;
        public var damageCharged:Number;

        public function ichigo_groundstab_special_25()
        {
            addFrameScript(0, this.frame1, 9, this.frame10, 12, this.frame13, 13, this.frame14, 14, this.frame15, 28, this.frame29);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
                this.self.playVoiceSound("attackVoice1");
            };
        }

        internal function frame10():*
        {
            this.xframe = "charging";
        }

        internal function frame13():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame14():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound("attackVoice2");
            this.chargeTime = (this.self.getExecTime() - 10);
            this.damageCharged = (((5 * this.chargeTime) / 40) + 12);
            this.self.updateAttackBoxStats(1, {"damage":this.damageCharged});
        }

        internal function frame15():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame29():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla

