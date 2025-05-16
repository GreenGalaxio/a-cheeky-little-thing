// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_aerial_n_170

package mario_fla
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

    public dynamic class mario_aerial_n_170 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var itemBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var landingBool:Boolean;

        public function mario_aerial_n_170()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 4, this.frame5, 9, this.frame10, 20, this.frame21, 21, this.frame22, 25, this.frame26);
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
            this.landingBool = false;
            if (((this.self) && (SSF2API.isReady())))
            {
                this.landingLag(false);
            };
        }

        internal function frame2():*
        {
            this.landingLag(true);
        }

        internal function frame3():*
        {
            SSF2API.playSound("brawl_swing_l");
            this.landingLag(true);
        }

        internal function frame5():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":55,
                "damage":8,
                "power":45,
                "effect_id":"effect_hit2"
            });
        }

        internal function frame10():*
        {
            this.landingLag(false);
        }

        internal function frame21():*
        {
            this.self.endAttack();
        }

        internal function frame22():*
        {
            if (SSF2API.isReady())
            {
                SSF2API.shakeCamera(1);
                this.self.setGlobalVariable("canStartRise", true);
            };
        }

        internal function frame26():*
        {
            this.self.endAttack();
        }


    }
}//package mario_fla

