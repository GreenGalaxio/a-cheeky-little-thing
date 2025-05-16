// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//captainfalcon_fla.falcon_nspec_46

package captainfalcon_fla
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

    public dynamic class falcon_nspec_46 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var facing:Boolean;
        public var reverseFalcon:Boolean;
        public var controls:Object;

        public function falcon_nspec_46()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 9, this.frame10, 20, this.frame21, 23, this.frame24, 25, this.frame26, 29, this.frame30, 33, this.frame34, 38, this.frame39);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
                this.facing = this.self.isFacingRight();
                this.reverseFalcon = false;
                this.self.playVoiceSound(1);
            };
        }

        internal function frame2():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame3():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.LEFT) && (this.facing)))
            {
                this.reverseFalcon = true;
            };
            if (((this.controls.RIGHT) && (!(this.facing))))
            {
                this.reverseFalcon = true;
            };
        }

        internal function frame4():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.LEFT) && (this.facing)))
            {
                this.reverseFalcon = true;
            };
            if (((this.controls.RIGHT) && (!(this.facing))))
            {
                this.reverseFalcon = true;
            };
        }

        internal function frame5():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.LEFT) && (this.facing)))
            {
                this.reverseFalcon = true;
            };
            if (((this.controls.RIGHT) && (!(this.facing))))
            {
                this.reverseFalcon = true;
            };
        }

        internal function frame6():*
        {
            if (this.reverseFalcon)
            {
                this.self.flip();
            };
        }

        internal function frame10():*
        {
            if (!this.self.isOnGround())
            {
                this.self.updateAttackStats({"allowControl":true});
            };
        }

        internal function frame21():*
        {
            if (!this.self.isOnGround())
            {
                this.self.updateAttackStats({"allowControl":false});
            };
        }

        internal function frame24():*
        {
            this.self.updateAttackStats({"air_ease":0});
            this.self.setXSpeed(8, false);
            this.self.playVoiceSound(2);
            this.self.playAttackSound(2);
            this.self.playAttackSound(3);
        }

        internal function frame26():*
        {
            this.self.attachEffect("falconAfterEffect");
        }

        internal function frame30():*
        {
            this.self.updateAttackStats({"air_ease":-1});
            if (!this.self.isOnGround())
            {
                this.self.updateAttackStats({"allowControl":true});
            };
        }

        internal function frame34():*
        {
            if (this.reverseFalcon)
            {
                gotoAndPlay("reverseSkip2");
            };
        }

        internal function frame39():*
        {
            this.self.endAttack();
        }


    }
}//package captainfalcon_fla

