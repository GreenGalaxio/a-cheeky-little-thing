// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.megaman_metalblade_162

package megaman_fla
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

    public dynamic class megaman_metalblade_162 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var character:*;
        public var pos1:Number;
        public var pos2:Number;
        public var projectile:*;

        public function megaman_metalblade_162()
        {
            addFrameScript(0, this.frame1, 9, this.frame10);
        }

        public function reenable(_arg_1:*=null):void
        {
            this.character.setAttackEnabled(true, "b");
        }

        public function climbWall(_arg_1:*=null):void
        {
            this.self.setYSpeed(-8);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
            };
            this.projectile = null;
            if (((SSF2API.isReady()) && (this.self)))
            {
                SSF2API.playSound("wheelcutter");
                this.projectile = this.self;
                SSF2API.addEventListener(this.self, SSF2Event.PROJ_DESTROYED, this.reenable);
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.climbWall);
            };
        }

        internal function frame10():*
        {
            this.gotoAndPlay("again");
        }


    }
}//package megaman_fla

