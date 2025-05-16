// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//peach_fla.uspecial_71

package peach_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class uspecial_71 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var newStats:Object;
        public var controls:Object;

        public function uspecial_71()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 17, this.frame18, 21, this.frame22, 23, this.frame24, 24, this.frame25, 25, this.frame26, 26, this.frame27, 27, this.frame28, 28, this.frame29, 29, this.frame30, 30, this.frame31, 31, this.frame32, 32, this.frame33, 33, this.frame34, 34, this.frame35, 37, this.frame38, 41, this.frame42, 43, this.frame44, 46, this.frame47, 47, this.frame48, 48, this.frame49, 49, this.frame50, 54, this.frame55);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setYSpeed(-19);
                this.self.setXSpeed(3, false);
                this.self.playAttackSound(1);
            };
        }

        internal function frame6():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
        }

        internal function frame18():*
        {
            this.newStats = {
                "weightKB":0,
                "power":20,
                "damage":1
            };
            this.self.updateAttackBoxStats(1, this.newStats);
            this.self.updateAttackBoxStats(2, this.newStats);
            this.newStats = {"refreshRate":50};
            this.self.updateAttackStats(this.newStats);
        }

        internal function frame22():*
        {
            this.newStats = {
                "allowControl":true,
                "xSpeedCap":-1
            };
            this.self.updateAttackStats(this.newStats);
        }

        internal function frame24():*
        {
            this.newStats = {"air_ease":2};
            this.self.updateAttackStats(this.newStats);
            this.newStats = {"power":30};
            this.self.updateAttackBoxStats(1, this.newStats);
            this.controls = this.self.getControls();
            this.controls = this.self.getControls();
            if (this.controls.DOWN == true)
            {
                gotoAndPlay("end");
            };
        }

        internal function frame25():*
        {
            this.controls = this.self.getControls();
            if (this.controls.DOWN == true)
            {
                gotoAndPlay("end");
            };
        }

        internal function frame26():*
        {
            this.controls = this.self.getControls();
            if (this.controls.DOWN == true)
            {
                gotoAndPlay("end");
            };
        }

        internal function frame27():*
        {
            this.controls = this.self.getControls();
            if (this.controls.DOWN == true)
            {
                gotoAndPlay("end");
            };
        }

        internal function frame28():*
        {
            this.controls = this.self.getControls();
            if (this.controls.DOWN == true)
            {
                gotoAndPlay("end");
            };
        }

        internal function frame29():*
        {
            this.controls = this.self.getControls();
            if (this.controls.DOWN == true)
            {
                gotoAndPlay("end");
            };
        }

        internal function frame30():*
        {
            this.controls = this.self.getControls();
            if (this.controls.DOWN == true)
            {
                gotoAndPlay("end");
            };
        }

        internal function frame31():*
        {
            this.controls = this.self.getControls();
            if (this.controls.DOWN == true)
            {
                gotoAndPlay("end");
            };
        }

        internal function frame32():*
        {
            this.controls = this.self.getControls();
            if (this.controls.DOWN == true)
            {
                gotoAndPlay("end");
            };
        }

        internal function frame33():*
        {
            this.controls = this.self.getControls();
            if (this.controls.DOWN == true)
            {
                gotoAndPlay("end");
            };
        }

        internal function frame34():*
        {
            this.controls = this.self.getControls();
            if (this.controls.DOWN == true)
            {
                gotoAndPlay("end");
            }
            else
            {
                gotoAndPlay("loop");
            };
        }

        internal function frame35():*
        {
            this.newStats = {"direction":270};
            this.self.updateAttackBoxStats(1, this.newStats);
            this.self.playAttackSound(3);
        }

        internal function frame38():*
        {
            this.newStats = {"air_ease":-1};
            this.self.updateAttackStats(this.newStats);
            this.self.refreshAttackID();
        }

        internal function frame42():*
        {
            this.controls = this.self.getControls();
            this.newStats = {"facedLedgesOnly":false};
            this.self.updateAttackStats(this.newStats);
            if (this.controls.UP == true)
            {
                gotoAndPlay("open");
            };
        }

        internal function frame44():*
        {
            this.self.refreshAttackID();
        }

        internal function frame47():*
        {
            gotoAndPlay("end2");
        }

        internal function frame48():*
        {
            this.self.refreshAttackID();
            this.self.playAttackSound(2);
            this.newStats = {"direction":90};
            this.self.updateAttackBoxStats(1, this.newStats);
            this.newStats = {"facedLedgesOnly":true};
            this.self.updateAttackStats(this.newStats);
        }

        internal function frame49():*
        {
            gotoAndPlay("loop");
        }

        internal function frame50():*
        {
            this.newStats = {"allowControl":false};
            this.self.updateAttackStats(this.newStats);
        }

        internal function frame55():*
        {
            this.self.endAttack();
        }


    }
}//package peach_fla

