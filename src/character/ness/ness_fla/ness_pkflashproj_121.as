// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.ness_pkflashproj_121

package ness_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.system.*;
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
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class ness_pkflashproj_121 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var character:*;
        public var charge:int;
        public var blah:Number;
        public var scale:*;
        public var damageCharged:Number;

        public function ness_pkflashproj_121()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 30, this.frame31, 61, this.frame62, 62, this.frame63);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
            };
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.charge = 0;
                this.blah = 0;
            };
        }

        internal function frame2():*
        {
            this.charge = 2;
            if (SSF2API.isReady())
            {
                this.blah = SSF2API.playSound("ness_flashProjectile");
            };
        }

        internal function frame3():*
        {
            this.charge++;
        }

        internal function frame4():*
        {
            this.charge++;
        }

        internal function frame5():*
        {
            this.charge++;
        }

        internal function frame6():*
        {
            this.charge++;
        }

        internal function frame7():*
        {
            this.charge++;
        }

        internal function frame8():*
        {
            this.charge++;
        }

        internal function frame9():*
        {
            this.charge++;
        }

        internal function frame10():*
        {
            this.charge++;
        }

        internal function frame11():*
        {
            this.charge++;
        }

        internal function frame12():*
        {
            this.charge++;
        }

        internal function frame13():*
        {
            this.charge++;
        }

        internal function frame14():*
        {
            this.charge++;
        }

        internal function frame15():*
        {
            this.charge++;
        }

        internal function frame16():*
        {
            this.charge++;
        }

        internal function frame17():*
        {
            this.charge++;
        }

        internal function frame18():*
        {
            this.charge++;
        }

        internal function frame19():*
        {
            this.charge++;
        }

        internal function frame20():*
        {
            this.charge++;
            this.gotoAndPlay("loop");
        }

        internal function frame21():*
        {
            this.scale = Math.log((0.15 * this.charge));
            if (this.scale < 1)
            {
                this.scale = 1;
            };
            SSF2API.print(this.scale);
            this.self.setScale(this.scale, this.scale);
            this.damageCharged = (((25 * this.charge) / 70) + 5);
            this.self.updateAttackBoxStats(1, {"damage":this.damageCharged});
            if (SSF2API != null)
            {
                SSF2API.playSound("ness_flashExplode");
            };
            this.self.updateProjectileStats({"ghost":true});
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.destroy);
            SSF2API.stopSound(this.blah);
        }

        internal function frame22():*
        {
            this.self.updateProjectileStats({"influenceXMovement":-1});
        }

        internal function frame31():*
        {
            SSF2API.shakeCamera((((25 * this.charge) / 70) + 5));
        }

        internal function frame62():*
        {
            stop();
        }

        internal function frame63():*
        {
            this.gotoAndStop("stopped");
        }


    }
}//package ness_fla

