// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_attackup_120

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

    public dynamic class ichigo_attackup_120 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var attackBox3:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var xframe:String;
        public var chargeTime:*;
        public var damageCharged:Number;

        public function ichigo_attackup_120()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 10, this.frame11, 11, this.frame12, 13, this.frame14, 19, this.frame20, 23, this.frame24, 34, this.frame35);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
        }

        internal function frame6():*
        {
            this.xframe = "charging";
        }

        internal function frame11():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame12():*
        {
            this.xframe = "attack";
        }

        internal function frame14():*
        {
            this.self.playVoiceSound(1);
            this.chargeTime = (this.self.getExecTime() - 5);
            this.damageCharged = (((6 * this.chargeTime) / 40) + 14);
            this.self.updateAttackBoxStats(1, {"damage":this.damageCharged});
        }

        internal function frame20():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame24():*
        {
            SSF2API.shakeCamera(1);
        }

        internal function frame35():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla

