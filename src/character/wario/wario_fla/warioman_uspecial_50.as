// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.warioman_uspecial_50

package wario_fla
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

    public dynamic class warioman_uspecial_50 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var controls:Object;

        public function warioman_uspecial_50()
        {
            addFrameScript(0, this.frame1, 24, this.frame25, 27, this.frame28, 39, this.frame40, 51, this.frame52, 63, this.frame64, 72, this.frame73);
        }

        public function uSpecConstant():void
        {
            this.controls = this.self.getControls();
            if (this.controls.DOWN)
            {
                this.self.updateAttackStats({"air_ease":-1});
                this.self.setYSpeed(5);
            }
            else
            {
                this.self.updateAttackStats({"air_ease":0});
                this.self.setYSpeed(-5);
            };
            if (this.controls.RIGHT)
            {
                this.self.setXSpeed(10);
            }
            else
            {
                if (this.controls.LEFT)
                {
                    this.self.setXSpeed(-10);
                };
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                if (this.self.isOnGround)
                {
                    this.self.unnattachFromGround();
                };
            };
        }

        internal function frame25():*
        {
            this.self.updateAttackStats({"air_ease":-1});
            SSF2API.createTimer(this.self, 1, 52, this.uSpecConstant);
        }

        internal function frame28():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame40():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame52():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame64():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame73():*
        {
            this.self.endAttack();
        }


    }
}//package wario_fla

