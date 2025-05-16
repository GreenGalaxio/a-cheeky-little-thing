// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.Protoshield2_gif_54

package megaman_fla
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

    public dynamic class Protoshield2_gif_54 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var shieldBox2:MovieClip;
        public var self:*;
        public var continuePlaying:Boolean;
        public var handled:Boolean;
        public var restart:Boolean;

        public function Protoshield2_gif_54()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 7, this.frame8, 10, this.frame11);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.continuePlaying = false;
            this.handled = true;
            this.restart = false;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playAttackSound(1);
                this.self.setXSpeed(10, false);
            };
        }

        internal function frame7():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame8():*
        {
            if (((!(this.continuePlaying == true)) && (!(this.restart))))
            {
                play();
            }
            else
            {
                gotoAndPlay("again");
            };
        }

        internal function frame11():*
        {
            this.self.endAttack();
        }


    }
}//package megaman_fla

