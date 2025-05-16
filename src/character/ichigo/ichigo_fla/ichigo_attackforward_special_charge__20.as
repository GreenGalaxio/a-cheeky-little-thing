// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_attackforward_special_charge__20

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

    public dynamic class ichigo_attackforward_special_charge__20 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var chargeTime:*;
        public var damageCharged:Number;

        public function ichigo_attackforward_special_charge__20()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 4, this.frame5, 5, this.frame6, 10, this.frame11);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
        }

        internal function frame2():*
        {
            this.xframe = "charging";
        }

        internal function frame5():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame6():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
            this.chargeTime = (this.self.getExecTime() - 1);
            this.damageCharged = (((8 * this.chargeTime) / 40) + 17);
            this.self.updateAttackBoxStats(1, {"damage":this.damageCharged});
        }

        internal function frame11():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla

