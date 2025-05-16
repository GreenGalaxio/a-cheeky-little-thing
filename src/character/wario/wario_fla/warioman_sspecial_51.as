// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.warioman_sspecial_51

package wario_fla
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

    public dynamic class warioman_sspecial_51 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var hasHit:Boolean;
        public var loop:int;
        public var controls:Object;
        public var character:*;

        public function warioman_sspecial_51()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 8, this.frame9, 12, this.frame13, 16, this.frame17, 17, this.frame18, 18, this.frame19);
        }

        public function toContinue(_arg_1:*):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.toContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT_SHIELD, this.toContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.toContinue);
            SSF2API.destroyTimer(this.self, this.jumpCheck);
            gotoAndPlay("continue");
        }

        public function jumpCheck():void
        {
            this.controls = this.self.getControls();
            if (((this.controls.UP) || (this.controls.JUMP)))
            {
                SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.toContinue);
                SSF2API.removeEventListener(this.self, SSF2Event.CHAR_SHIELD_HIT, this.toContinue);
                SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.toContinue);
                SSF2API.destroyTimer(this.self, this.jumpCheck);
                gotoAndPlay("continue");
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.hasHit = false;
            this.loop = 0;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.toContinue);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT_SHIELD, this.toContinue);
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.toContinue);
            };
        }

        internal function frame7():*
        {
            SSF2API.playSound("wariobikerev");
            SSF2API.createTimer(this.self, 1, 0, this.jumpCheck);
        }

        internal function frame9():*
        {
            this.self.setXSpeed(30, false);
        }

        internal function frame13():*
        {
            this.self.setXSpeed(18, false);
            this.loop++;
            if (this.loop > 8)
            {
                SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.toContinue);
                SSF2API.removeEventListener(this.self, SSF2Event.CHAR_SHIELD_HIT, this.toContinue);
                SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.toContinue);
                SSF2API.destroyTimer(this.self, this.jumpCheck);
                gotoAndPlay("continue");
            };
        }

        internal function frame17():*
        {
            this.gotoAndPlay("riding");
        }

        internal function frame18():*
        {
            this.hasHit = true;
            this.self.setXSpeed(0);
            this.self.updateAttackStats({
                "xSpeedDecay":0,
                "xSpeedDecayAir":0
            });
            this.self.setYSpeed(-10);
            SSF2API.destroyTimer(this.self, this.jumpCheck);
            this.self.fireProjectile("warioman_bike_kaboom", 0, false);
        }

        internal function frame19():*
        {
            this.self.endAttack();
        }


    }
}//package wario_fla

