// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//tails_fla.tailsplane_105

package tails_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
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

    public dynamic class tailsplane_105 extends MovieClip 
    {

        public var self:*;
        public var canTarget:Boolean;
        public var canShoot:Boolean;
        public var numBullets:Number;
        public var numBombs:Number;
        public var delay:int;
        public var delayTimer:int;

        public function tailsplane_105()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 23, this.frame24, 53, this.frame54, 56, this.frame57, 57, this.frame58, 62, this.frame63, 63, this.frame64, 68, this.frame69, 69, this.frame70, 93, this.frame94);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.canTarget = false;
            this.canShoot = false;
            this.numBullets = 0;
            this.numBombs = 0;
            this.delay = 10;
            this.delayTimer = this.delay;
        }

        internal function frame3():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame24():*
        {
            this.visible = false;
        }

        internal function frame54():*
        {
            if (((this.numBullets >= 10) || (this.numBombs >= 1)))
            {
                this.canShoot = false;
                this.canTarget = true;
                this.delayTimer--;
                if (this.delayTimer <= 0)
                {
                    SSF2API.playSound("fsReady");
                    this.numBullets = 0;
                    this.numBombs = 0;
                    this.delayTimer = this.delay;
                };
            }
            else
            {
                this.canShoot = true;
                this.canTarget = true;
            };
        }

        internal function frame57():*
        {
            gotoAndPlay("idle");
        }

        internal function frame58():*
        {
            this.canShoot = false;
            this.numBullets++;
        }

        internal function frame63():*
        {
            gotoAndPlay("idle");
        }

        internal function frame64():*
        {
            this.canShoot = false;
            this.numBombs++;
        }

        internal function frame69():*
        {
            gotoAndPlay("idle");
        }

        internal function frame70():*
        {
            this.canShoot = false;
            this.canTarget = false;
            this.visible = true;
            this.self.playVoiceSound(2);
        }

        internal function frame94():*
        {
            this.self.endAttack();
        }


    }
}//package tails_fla

