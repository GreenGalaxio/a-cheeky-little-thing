// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//link_fla.link_new_arrow_115

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

    public dynamic class link_new_arrow_115 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var self:*;
        public var arrowCharge:Number;
        public var arrowMax:Number;
        public var arrowXSpeed:Number;
        public var arrowGravity:Number;
        public var arrowFinal:Number;
        public var character:*;

        public function link_new_arrow_115()
        {
            addFrameScript(0, this.frame1, 2, this.frame3);
        }

        public function toContinue(_arg_1:*):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_LAND, this.toContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.toContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.toContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.toContinue);
            this.self.updateProjectileStats({"trailEffect":null});
            this.self.destroy();
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            this.arrowCharge = 0;
            this.arrowMax = 0;
            this.arrowXSpeed = 0;
            this.arrowGravity = 0;
            this.arrowFinal = 0;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                this.arrowCharge = this.character.getGlobalVariable("globCharge");
                this.arrowMax = this.character.getAttackStat("chargetime_max");
                this.arrowXSpeed = this.self.getProjectileStat("xspeed");
                if (this.arrowCharge != this.arrowMax)
                {
                    this.arrowFinal = ((this.arrowCharge * 0.25) + ((this.arrowXSpeed * 0.75) * (this.arrowCharge / this.arrowMax)));
                    this.self.setXSpeed(this.arrowFinal, false);
                };
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toContinue);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_LAND, this.toContinue);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.toContinue);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.toContinue);
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.toContinue);
            };
        }

        internal function frame3():*
        {
            gotoAndPlay("loop");
        }


    }
}//package link_fla

