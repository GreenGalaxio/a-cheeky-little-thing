// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zelda_fla.sheik_sspec_41

package zelda_fla
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

    public dynamic class sheik_sspec_41 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var attackBox3:MovieClip;
        public var attackBox4:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var hitBox7:MovieClip;
        public var self:*;
        public var controls:Object;

        public function sheik_sspec_41()
        {
            addFrameScript(0, this.frame1, 17, this.frame18, 18, this.frame19, 38, this.frame39, 39, this.frame40, 41, this.frame42, 43, this.frame44, 45, this.frame46, 47, this.frame48, 49, this.frame50, 50, this.frame51);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame18():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.BUTTON1) && ((((this.controls.UP) || (this.controls.DOWN)) || (this.controls.LEFT)) || (this.controls.RIGHT))))
            {
                gotoAndPlay("whip");
            }
            else
            {
                if (!this.controls.BUTTON1)
                {
                    gotoAndPlay("end");
                };
            };
        }

        internal function frame19():*
        {
            gotoAndPlay("loop");
        }

        internal function frame39():*
        {
            this.self.endAttack();
        }

        internal function frame40():*
        {
            this.self.updateAttackBoxStats(1, {"direction":43});
            this.self.refreshAttackID();
        }

        internal function frame42():*
        {
            this.self.playAttackSound(1);
            this.self.refreshAttackID();
        }

        internal function frame44():*
        {
            this.self.refreshAttackID();
        }

        internal function frame46():*
        {
            this.self.refreshAttackID();
        }

        internal function frame48():*
        {
            this.self.refreshAttackID();
        }

        internal function frame50():*
        {
            this.self.refreshAttackID();
        }

        internal function frame51():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.BUTTON1) && ((((this.controls.UP) || (this.controls.DOWN)) || (this.controls.LEFT)) || (this.controls.RIGHT))))
            {
                gotoAndPlay("whip");
            }
            else
            {
                if (((this.controls.BUTTON1) && (!((((this.controls.UP) || (this.controls.DOWN)) || (this.controls.LEFT)) || (this.controls.RIGHT)))))
                {
                    gotoAndPlay("still");
                }
                else
                {
                    gotoAndPlay("end");
                };
            };
        }


    }
}//package zelda_fla

