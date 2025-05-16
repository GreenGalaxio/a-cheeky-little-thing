// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_fallclone_184

package naruto_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
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

    public dynamic class naruto_fallclone_184 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var character:*;
        public var player_id:Number;
        public var landed:*;
        public var naruto_language:*;

        public function naruto_fallclone_184()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 9, this.frame10, 14, this.frame15, 15, this.frame16, 21, this.frame22, 22, this.frame23);
        }

        public function afterHit(_arg_1:Event=null):void
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.afterHit);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.afterHit);
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toContinue);
            this.gotoAndPlay("end");
        }

        public function toContinue(_arg_1:Event=null):void
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toContinue);
            this.landed = true;
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            this.gotoAndPlay("continue");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                this.player_id = 0;
                this.landed = false;
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT, this.afterHit);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.afterHit);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toContinue);
                this.naruto_language = this.character.getGlobalVariable("language_Select");
            };
        }

        internal function frame8():*
        {
            gotoAndPlay("loop");
        }

        internal function frame10():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":270,
                "power":10,
                "kbConstant":0,
                "hitLag":1
            });
        }

        internal function frame15():*
        {
            gotoAndPlay("ontheground");
        }

        internal function frame16():*
        {
            SSF2API.playSound("naruto_bunshin");
            if (this.landed == true)
            {
                if (this.naruto_language == "JPN")
                {
                    SSF2API.playSound("naruto_taunt");
                }
                else
                {
                    SSF2API.playSound("ENG_naruto_gotcha", true);
                };
            };
        }

        internal function frame22():*
        {
            stop();
        }

        internal function frame23():*
        {
            gotoAndStop("stopped");
        }


    }
}//package naruto_fla

