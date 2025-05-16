// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.iceprojectileBM2_190

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

    public dynamic class iceprojectileBM2_190 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var character:*;
        public var isOnGround:*;
        public var newProjectile:*;
        public var currentX:*;
        public var currentY:*;

        public function iceprojectileBM2_190()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 3, this.frame4, 5, this.frame6, 20, this.frame21, 25, this.frame26, 26, this.frame27);
        }

        public function toEnd(_arg_1:*):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.PROJ_DESTROYED, this.toEnd);
            gotoAndPlay("end");
        }

        public function destroy():void
        {
            this.isOnGround = this.self.isOnGround();
            if (((!(this.isOnGround)) || (this.self.getGlobalVariable("destroy") == "true")))
            {
                this.self.destroy();
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
            };
            this.isOnGround = false;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.visible = false;
                SSF2API.addEventListener(this.self, SSF2Event.PROJ_DESTROYED, this.toEnd);
            };
        }

        internal function frame2():*
        {
            SSF2API.createTimer(this.self, 1, 20, this.destroy, false);
        }

        internal function frame4():*
        {
            if (this != null)
            {
                this.visible = true;
            };
        }

        internal function frame6():*
        {
            SSF2API.playSound("iceshoot2");
            this.currentX = this.self.getX();
            this.currentY = this.self.getY();
            this.character.fireProjectile("dsmashfullleft", (this.currentX - 20), this.currentY, true);
            this.newProjectile = this.character.getCurrentProjectile();
            this.newProjectile.setXSpeed(-2);
        }

        internal function frame21():*
        {
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            this.self.updateProjectileStats({"maxgravity":0});
        }

        internal function frame26():*
        {
            this.self.destroy();
        }

        internal function frame27():*
        {
            this.self.setGlobalVariable("streamEndProjectile1", true);
            SSF2API.print("Stream 1 down!");
            this.self.destroy();
        }


    }
}//package blackmage_fla

