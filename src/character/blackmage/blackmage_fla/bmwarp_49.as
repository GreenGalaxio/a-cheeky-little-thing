// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmwarp_49

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

    public dynamic class bmwarp_49 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var xframe:String;
        public var projectile:*;

        public function bmwarp_49()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 6, this.frame7, 7, this.frame8, 22, this.frame23, 23, this.frame24, 24, this.frame25, 25, this.frame26, 33, this.frame34, 36, this.frame37);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (((parent) && (SSF2API.isReady())))
            {
                this.xframe = null;
                SSF2API.playSound("bm_Warp_part1");
                this.projectile = null;
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
                this.self.setGlobalVariable("Boost", 0);
                if (((this.self.isCPU()) && (!(this.self.isOnGround()))))
                {
                    if (this.self.inLowerLeftWarningBounds())
                    {
                        this.self.importCPUControls([6465, 56]);
                    }
                    else
                    {
                        if (this.self.inLowerRightWarningBounds())
                        {
                            this.self.importCPUControls([6721, 53]);
                        };
                    };
                };
            };
        }

        internal function frame6():*
        {
            this.self.fireProjectile("warp");
            this.projectile = this.self.getCurrentProjectile();
        }

        internal function frame7():*
        {
            this.xframe = "charging";
            if (this.self.getCurrentProjectile() != null)
            {
                this.self.getCurrentProjectile().updateProjectileStats({"controlDirection":90});
            };
        }

        internal function frame8():*
        {
            if (this.self.getCurrentProjectile() != null)
            {
                this.self.getCurrentProjectile().endControl();
            };
        }

        internal function frame23():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame24():*
        {
            this.xframe = "attack";
            SSF2API.playSound("bm_Warp_part2");
            if (this.self.getCurrentProjectile() != null)
            {
                this.projectile.endControl();
            };
        }

        internal function frame25():*
        {
            if (this.self.getCurrentProjectile() != null)
            {
                this.projectile.forceContinue();
            };
        }

        internal function frame26():*
        {
            this.self.updateAttackStats({"air_ease":0});
            if (this.self.getCurrentProjectile() != null)
            {
                this.projectile.setXSpeed(0);
                this.projectile.setYSpeed(0);
            };
        }

        internal function frame34():*
        {
            if (this.self.getCurrentProjectile() != null)
            {
                parent.x = this.projectile.getMC().x;
                parent.y = this.projectile.getMC().y;
            };
            if (this.self.getCurrentProjectile() != null)
            {
                this.projectile.destroy();
            };
        }

        internal function frame37():*
        {
            this.self.endAttack();
        }


    }
}//package blackmage_fla

