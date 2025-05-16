// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.megaman_forwardair_gif_58

package megaman_fla
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

    public dynamic class megaman_forwardair_gif_58 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var blah:Number;
        public var landingBool:Boolean;

        public function megaman_forwardair_gif_58()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 5, this.frame6, 10, this.frame11, 11, this.frame12, 12, this.frame13, 14, this.frame15, 15, this.frame16, 24, this.frame25);
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.updateAttackStats({"allowControl":false});
            gotoAndPlay("continue");
        }

        public function landingLag(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            }
            else
            {
                SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.blah = 0;
            this.landingBool = false;
            if (((this.self) && (SSF2API.isReady())))
            {
                this.landingLag(false);
            };
        }

        internal function frame4():*
        {
            this.landingLag(true);
        }

        internal function frame5():*
        {
            this.blah = this.self.playAttackSound(1);
        }

        internal function frame6():*
        {
            this.self.updateAttackBoxStats(1, {"direction":15});
        }

        internal function frame11():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "power":45,
                "damage":6,
                "kbConstant":85,
                "hitStun":3,
                "selfHitStun":1,
                "direction":60
            });
        }

        internal function frame12():*
        {
            this.landingLag(false);
        }

        internal function frame13():*
        {
            this.self.updateAttackStats({"air_ease":-1});
            SSF2API.stopSound(this.blah);
        }

        internal function frame15():*
        {
            this.self.endAttack();
        }

        internal function frame16():*
        {
            SSF2API.stopSound(this.blah);
        }

        internal function frame25():*
        {
            this.self.endAttack();
        }


    }
}//package megaman_fla

