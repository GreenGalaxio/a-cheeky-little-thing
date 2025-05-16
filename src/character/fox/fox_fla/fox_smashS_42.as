// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fox_fla.fox_smashS_42

package fox_fla
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

    public dynamic class fox_smashS_42 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var xframe:String;
        public var chargeTime:*;
        public var damageCharged:Number;

        public function fox_smashS_42()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 9, this.frame10, 10, this.frame11, 17, this.frame18, 24, this.frame25);
        }

        public function moveForward():void
        {
            this.self.setXSpeed(6.2, false);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame5():*
        {
            this.xframe = "charging";
        }

        internal function frame10():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame11():*
        {
            SSF2API.createTimer(this.self, 1, 10, this.moveForward);
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
            this.chargeTime = (this.self.getExecTime() - 4);
            this.damageCharged = (((4 * this.chargeTime) / 40) + 12);
            this.self.updateAttackBoxStats(1, {"damage":this.damageCharged});
        }

        internal function frame18():*
        {
            this.self.updateAttackStats({"air_ease":-1});
        }

        internal function frame25():*
        {
            this.self.endAttack();
        }


    }
}//package fox_fla

