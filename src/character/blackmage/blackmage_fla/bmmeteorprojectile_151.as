// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmmeteorprojectile_151

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

    public dynamic class bmmeteorprojectile_151 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var character:*;
        public var temp:*;

        public function bmmeteorprojectile_151()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 8, this.frame9, 17, this.frame18, 31, this.frame32);
        }

        public function toContinue(_arg_1:*):*
        {
            this.gotoAndPlay("continue");
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.toContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.toContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.toContinue);
        }

        public function cameraRemove(_arg_1:*):*
        {
            SSF2API.removeEventListener(this.character, SSF2Event.CHAR_HURT, this.cameraRemove);
            this.self.removeFromCamera();
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                this.self.addToCamera();
                SSF2API.addEventListener(this.character, SSF2Event.CHAR_HURT, this.cameraRemove);
            };
        }

        internal function frame3():*
        {
            this.gotoAndPlay("redo");
        }

        internal function frame4():*
        {
            this.temp = SSF2API.getProjectile(this);
            if (!this.self)
            {
                this.self = this.temp;
            };
            this.self.removeFromCamera();
            this.self.updateAttackBoxStats(1, {"effectSound":"brawl_fire_l"});
            SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.toContinue);
            SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.toContinue);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toContinue);
            SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.toContinue);
        }

        internal function frame9():*
        {
            this.gotoAndPlay("loop");
        }

        internal function frame18():*
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

        internal function frame32():*
        {
            this.self.updateProjectileStats({"time_max":1});
        }


    }
}//package blackmage_fla

