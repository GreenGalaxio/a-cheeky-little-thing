// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//link_fla.link_new_bombArrow_118

package link_fla
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

    public dynamic class link_new_bombArrow_118 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var character:*;
        public var throughCharacter:*;
        public var bombType:String;
        public var player:*;
        public var projectile:*;

        public function link_new_bombArrow_118()
        {
            addFrameScript(0, this.frame1, 19, this.frame20, 21, this.frame22, 34, this.frame35, 35, this.frame36, 36, this.frame37);
        }

        public function toContinue(_arg_1:*):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_LAND, this.toContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.toContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.toContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.toContinue);
            gotoAndPlay("continue");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                this.player = null;
                this.projectile = this.self;
                this.throughCharacter = this.character;
                this.bombType = this.throughCharacter.getGlobalVariable("bombType");
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toContinue);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_LAND, this.toContinue);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.toContinue);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.toContinue);
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.toContinue);
            };
        }

        internal function frame20():*
        {
            gotoAndPlay("loop");
        }

        internal function frame22():*
        {
            SSF2API.playSound("brawl_bomb_l");
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            this.self.updateAttackBoxStats(1, {"hitStun":5});
            this.self.updateProjectileStats({"maxgravity":0});
        }

        internal function frame35():*
        {
            stop();
        }

        internal function frame36():*
        {
            stop();
        }

        internal function frame37():*
        {
            gotoAndPlay("stopped");
        }


    }
}//package link_fla

