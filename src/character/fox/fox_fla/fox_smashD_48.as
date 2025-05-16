// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fox_fla.fox_smashD_48

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

    public dynamic class fox_smashD_48 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var attackBox3:MovieClip;
        public var attackBox4:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var xframe:String;
        public var chargeTime:*;
        public var damageCharged:Number;
        public var i:Number;

        public function fox_smashD_48()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 6, this.frame7, 7, this.frame8, 28, this.frame29);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame2():*
        {
            this.xframe = "charging";
        }

        internal function frame7():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame8():*
        {
            this.xframe = "attack";
            this.self.playAttackSound(1);
            this.self.playVoiceSound(1);
            this.chargeTime = (this.self.getExecTime() - 1);
            this.damageCharged = (((6 * this.chargeTime) / 40) + 14);
            this.i = 1;
            while (this.i < 5)
            {
                if (this.i <= 2)
                {
                    this.self.updateAttackBoxStats(this.i, {"damage":(this.damageCharged - 2)});
                }
                else
                {
                    this.self.updateAttackBoxStats(this.i, {"damage":this.damageCharged});
                };
                this.i++;
            };
        }

        internal function frame29():*
        {
            this.self.endAttack();
        }


    }
}//package fox_fla

