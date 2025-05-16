// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmmeteorprojectileair_183

package blackmage_fla
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

    public dynamic class bmmeteorprojectileair_183 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var character:*;
        public var playerIsOnGround:*;
        public var temp:*;

        public function bmmeteorprojectileair_183()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 5, this.frame6, 6, this.frame7, 11, this.frame12, 20, this.frame21, 34, this.frame35);
        }

        public function toContinue(_arg_1:*):*
        {
            gotoAndPlay("continue");
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.toContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.toContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.toContinue);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
            };
            this.playerIsOnGround = false;
        }

        internal function frame3():*
        {
            this.playerIsOnGround = this.character.isOnGround();
            if (!this.playerIsOnGround)
            {
                this.gotoAndPlay("redolanded");
            };
            if (this.playerIsOnGround)
            {
                this.gotoAndPlay("redo");
            };
        }

        internal function frame6():*
        {
            this.gotoAndPlay("redolanded");
        }

        internal function frame7():*
        {
            this.temp = SSF2API.getProjectile(this);
            if (!this.self)
            {
                this.self = this.temp;
            };
            SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.toContinue);
            SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.toContinue);
            SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.toContinue);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toContinue);
        }

        internal function frame12():*
        {
            this.gotoAndPlay("loop");
        }

        internal function frame21():*
        {
            this.self.updateProjectileStats({"maxgravity":0});
            this.self.updateAttackBoxStats(1, {
                "direction":40,
                "power":92,
                "kbConstant":60,
                "hitStun":1,
                "effectSound":null
            });
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            SSF2API.playSound("bombexplode");
            this.self.refreshAttackID();
        }

        internal function frame35():*
        {
            this.self.updateProjectileStats({"time_max":1});
        }


    }
}//package blackmage_fla

