// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_clone2_18

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

    public dynamic class naruto_clone2_18 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var character:*;
        public var naruto_language:*;
        public var player_id:Number;
        public var onGround:Boolean;
        public var playsound:Number;
        public var audio:Number;

        public function naruto_clone2_18()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 15, this.frame16, 23, this.frame24, 24, this.frame25);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                this.naruto_language = this.character.getGlobalVariable("language_Select");
            };
            this.player_id = 0;
            this.onGround = false;
        }

        internal function frame2():*
        {
            if (SSF2API != null)
            {
                this.onGround = this.self.isOnGround();
            };
            if (((!(this.onGround)) && (!(SSF2API == null))))
            {
                this.character.fireProjectile("naruto_clone");
                this.self.destroy();
            };
            this.visible = true;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.character.getGlobalVariable("audio");
            };
            if (this.naruto_language == "JPN")
            {
                if ((((this.playsound > 0.2) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
                {
                    SSF2API.playSound("naruto_cloneattack1");
                    this.character.setGlobalVariable("audio", 1);
                };
                if ((((this.playsound > 0.4) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
                {
                    SSF2API.playSound("naruto_cloneattack1");
                    this.character.setGlobalVariable("audio", 2);
                };
                if ((((this.playsound > 0.6) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
                {
                    SSF2API.playSound("naruto_cloneattack2");
                    this.character.setGlobalVariable("audio", 3);
                };
                if ((((this.playsound > 0.8) && (this.playsound <= 1)) && (!(this.audio == 4))))
                {
                    SSF2API.playSound("naruto_cloneattack2");
                    this.character.setGlobalVariable("audio", 4);
                };
            }
            else
            {
                if ((((this.playsound > 0.2) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
                {
                    SSF2API.playSound("ENG_naruto_syeah");
                    this.character.setGlobalVariable("audio", 1);
                };
                if ((((this.playsound > 0.4) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
                {
                    SSF2API.playSound("ENG_naruto_syeah");
                    this.character.setGlobalVariable("audio", 2);
                };
                if ((((this.playsound > 0.6) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
                {
                    SSF2API.playSound("ENG_naruto_syeah");
                    this.character.setGlobalVariable("audio", 3);
                };
                if ((((this.playsound > 0.8) && (this.playsound <= 1)) && (!(this.audio == 4))))
                {
                    this.character.setGlobalVariable("audio", 4);
                };
            };
            SSF2API.playSound("whoosh1");
        }

        internal function frame16():*
        {
            SSF2API.playSound("naruto_bunshin");
        }

        internal function frame24():*
        {
            stop();
        }

        internal function frame25():*
        {
            this.gotoAndStop("stopped");
        }


    }
}//package naruto_fla

