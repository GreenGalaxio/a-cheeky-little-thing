// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_forwardsmash_112

package naruto_fla
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

    public dynamic class naruto_forwardsmash_112 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var attackBox3:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var naruto_language:*;
        public var xframe:String;

        public function naruto_forwardsmash_112()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 11, this.frame12, 12, this.frame13, 21, this.frame22, 26, this.frame27);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.naruto_language = this.self.getGlobalVariable("language_Select");
            };
        }

        internal function frame7():*
        {
            this.xframe = "charging";
        }

        internal function frame12():*
        {
            gotoAndPlay("charging");
        }

        internal function frame13():*
        {
            this.xframe = "attack";
            if (this.naruto_language == "ENG")
            {
                this.self.playVoiceSound(2);
            }
            else
            {
                this.self.playVoiceSound(1);
            };
            this.self.playAttackSound(1);
            this.self.setXSpeed(26, false);
        }

        internal function frame22():*
        {
            this.self.setXSpeed(0, false);
        }

        internal function frame27():*
        {
            this.self.endAttack();
        }


    }
}//package naruto_fla

