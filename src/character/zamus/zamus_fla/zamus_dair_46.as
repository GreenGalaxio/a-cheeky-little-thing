// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zamus_fla.zamus_dair_46

package zamus_fla
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

    public dynamic class zamus_dair_46 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;

        public function zamus_dair_46()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 25, this.frame26, 33, this.frame34, 34, this.frame35, 40, this.frame41);
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
                SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            }
            else
            {
                SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((this.self) && (SSF2API.isReady())))
            {
                this.landingLag(false);
                this.self.setGlobalVariable("tether", true);
                this.self.playAttackSound(1);
            };
        }

        internal function frame8():*
        {
            this.self.setYSpeed(15);
            this.self.setXSpeed(8, false);
            this.self.playAttackSound(2);
            this.landingLag(true);
        }

        internal function frame26():*
        {
            this.landingLag(false);
        }

        internal function frame34():*
        {
            this.self.endAttack();
        }

        internal function frame35():*
        {
            this.self.updateAttackStats({"allowControl":false});
            this.self.updateAttackBoxStats(1, {
                "damage":4,
                "direction":45,
                "power":35,
                "kbConstant":90,
                "selfHitStun":0
            });
            this.self.resetMovement(true);
            this.self.refreshAttackID();
            this.self.playAttackSound(3);
        }

        internal function frame41():*
        {
            this.self.endAttack();
        }


    }
}//package zamus_fla

