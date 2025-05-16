// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.ssgoku_combo_574

package goku_fla
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

    public dynamic class ssgoku_combo_574 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var continuePlaying:Boolean;
        public var handled:Boolean;
        public var restart:Boolean;

        public function ssgoku_combo_574()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 8, this.frame9, 9, this.frame10, 10, this.frame11, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 19, this.frame20);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.continuePlaying = false;
                this.handled = true;
                this.restart = false;
                this.self.playVoiceSound(1);
            };
        }

        internal function frame5():*
        {
            this.continuePlaying = false;
            this.handled = false;
            this.self.playAttackSound(1);
        }

        internal function frame9():*
        {
            if (((!(this.continuePlaying == true)) && (!(this.restart))))
            {
                this.self.endAttack();
            }
            else
            {
                if (this.restart)
                {
                    gotoAndPlay("begin");
                };
            };
        }

        internal function frame10():*
        {
            this.continuePlaying = false;
            this.handled = false;
            this.self.playAttackSound(1);
        }

        internal function frame11():*
        {
            if (((!(this.continuePlaying == true)) && (!(this.restart))))
            {
                this.self.endAttack();
            }
            else
            {
                if (this.restart)
                {
                    gotoAndPlay("begin");
                };
            };
        }

        internal function frame13():*
        {
            this.continuePlaying = false;
            this.handled = false;
            this.self.playAttackSound(1);
        }

        internal function frame14():*
        {
            if (((!(this.continuePlaying == true)) && (!(this.restart))))
            {
                this.self.endAttack();
            }
            else
            {
                if (this.restart)
                {
                    gotoAndPlay("begin");
                };
            };
        }

        internal function frame15():*
        {
            this.continuePlaying = false;
            this.handled = false;
            this.self.playAttackSound(1);
        }

        internal function frame16():*
        {
            if (((!(this.continuePlaying == true)) && (!(this.restart))))
            {
                gotoAndPlay("ending");
            }
            else
            {
                this.gotoAndPlay("again");
            };
        }

        internal function frame20():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla

