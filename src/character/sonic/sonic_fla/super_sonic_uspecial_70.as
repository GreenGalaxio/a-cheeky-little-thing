// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.super_sonic_uspecial_70

package sonic_fla
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

    public dynamic class super_sonic_uspecial_70 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var controls:Object;
        public var controlCheck:Boolean;

        public function super_sonic_uspecial_70()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 20, this.frame21, 24, this.frame25);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = null;
            };
        }

        internal function frame7():*
        {
            this.self.playAttackSound(1);
            this.self.updateAttackStats({"rotate":true});
            this.self.unnattachFromGround();
            this.controls = this.self.getControls();
            this.controlCheck = false;
            if (((!((this.controls.UP) && (this.controls.DOWN))) && (!((this.controls.LEFT) && (this.controls.RIGHT)))))
            {
                if (((this.controls.DOWN) && (!(this.controls.UP))))
                {
                    this.self.setYSpeed(30);
                    this.controlCheck = true;
                }
                else
                {
                    if (this.controls.UP)
                    {
                        this.self.setYSpeed(-30);
                        this.controlCheck = true;
                    };
                };
                if (((this.controls.RIGHT) && (!(this.controls.LEFT))))
                {
                    this.self.faceRight();
                    this.self.setXSpeed(30);
                    this.controlCheck = true;
                }
                else
                {
                    if (((this.controls.LEFT) && (!(this.controls.RIGHT))))
                    {
                        this.self.faceLeft();
                        this.self.setXSpeed(-30);
                        this.controlCheck = true;
                    };
                };
            };
            if (!this.controlCheck)
            {
                this.self.setXSpeed(30, false);
            };
        }

        internal function frame21():*
        {
            this.self.updateAttackStats({"rotate":false});
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
        }

        internal function frame25():*
        {
            this.self.endAttack();
        }


    }
}//package sonic_fla

