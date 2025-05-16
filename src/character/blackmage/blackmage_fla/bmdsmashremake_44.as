// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmdsmashremake_44

package blackmage_fla
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

    public dynamic class bmdsmashremake_44 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var xframe:String;
        public var blah:Number;
        public var dir:Boolean;
        public var rightTrailx:*;
        public var leftTrailx:*;
        public var rightTrail:*;
        public var leftTrail:*;

        public function bmdsmashremake_44()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 9, this.frame10, 10, this.frame11, 17, this.frame18, 26, this.frame27, 37, this.frame38, 38, this.frame39, 49, this.frame50, 50, this.frame51, 51, this.frame52, 61, this.frame62);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (((parent) && (SSF2API.isReady())))
            {
                this.self.setGlobalVariable("Boost", 0);
            };
            this.xframe = null;
            this.blah = 0;
        }

        internal function frame4():*
        {
            this.blah = this.self.playAttackSound(1);
        }

        internal function frame5():*
        {
            this.xframe = "charging";
        }

        internal function frame10():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame11():*
        {
            this.xframe = "attack";
        }

        internal function frame18():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame27():*
        {
            this.self.playAttackSound(2);
            this.self.refreshAttackID();
        }

        internal function frame38():*
        {
            this.self.endAttack();
        }

        internal function frame39():*
        {
            this.dir = this.self.isFacingRight();
            this.self.setGlobalVariable("blackMageFacingRight", this.dir);
            this.self.setGlobalVariable("destroy", "true");
            this.xframe = "attack2";
            this.rightTrailx = 0;
            this.leftTrailx = 0;
            if (this.self.isFacingRight)
            {
                this.rightTrailx = 10;
                this.leftTrailx = -10;
            }
            else
            {
                this.rightTrailx = -10;
                this.leftTrailx = 10;
            };
            this.rightTrail = null;
            this.leftTrail = null;
            this.self.playAttackSound(3);
        }

        internal function frame50():*
        {
            this.self.setGlobalVariable("destroy", "false");
        }

        internal function frame51():*
        {
            this.self.fireProjectile("dsmashfullright", this.rightTrailx);
            this.rightTrail = this.self.getCurrentProjectile();
            this.self.fireProjectile("dsmashfullleft", this.leftTrailx);
            this.leftTrail = this.self.getCurrentProjectile();
            this.rightTrailx = (this.rightTrailx + 10);
            this.leftTrailx = (this.leftTrailx - 10);
        }

        internal function frame52():*
        {
            this.self.fireProjectile("dsmashfullright", this.rightTrailx);
            this.rightTrail = this.self.getCurrentProjectile();
            this.self.fireProjectile("dsmashfullleft", this.leftTrailx);
            this.leftTrail = this.self.getCurrentProjectile();
        }

        internal function frame62():*
        {
            this.self.endAttack();
        }


    }
}//package blackmage_fla

