// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_sword_46

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
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
    import flash.xml.*;

    public dynamic class kirby_sword_46 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var self:*;
        public var waiting:*;
        public var landingBool:Boolean;

        public function kirby_sword_46()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 9, this.frame10, 11, this.frame12, 13, this.frame14, 14, this.frame15, 17, this.frame18, 19, this.frame20, 20, this.frame21, 21, this.frame22, 23, this.frame24, 34, this.frame35);
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.moveDown);
            this.self.updateAttackStats({"allowControl":false});
            gotoAndPlay("continue");
        }

        public function moveDown():void
        {
            this.self.setYSpeed(20);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.waiting = false;
            this.landingBool = false;
            if (((this.self) && (SSF2API.isReady())))
            {
                this.self.playVoiceSound(1);
                this.self.playAttackSound(1);
                SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            };
        }

        internal function frame7():*
        {
            this.self.updateAttackStats({"allowControl":true});
            this.self.playVoiceSound(2);
            this.self.setYSpeed(-25);
        }

        internal function frame10():*
        {
            this.self.updateAttackStats({"air_ease":-1});
        }

        internal function frame12():*
        {
            this.self.setYSpeed(0);
        }

        internal function frame14():*
        {
            this.self.updateAttackStats({"air_ease":0});
        }

        internal function frame15():*
        {
            this.self.updateAttackStats({"air_ease":1});
            this.self.playAttackSound(2);
        }

        internal function frame18():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "direction":280,
                "power":100
            });
        }

        internal function frame20():*
        {
            SSF2API.createTimer(this.self, 1, 0, this.moveDown);
        }

        internal function frame21():*
        {
            this.self.updateAttackStats({"air_ease":-1});
            if (this.self.isOnGround())
            {
                this.jumpToContinue();
            }
            else
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            };
            this.waiting = true;
            stop();
        }

        internal function frame22():*
        {
            gotoAndStop("freeze");
        }

        internal function frame24():*
        {
            this.waiting = false;
            play();
            this.self.fireProjectile("kirby_swordwave");
            this.self.playVoiceSound(3);
            this.self.playAttackSound(3);
        }

        internal function frame35():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

