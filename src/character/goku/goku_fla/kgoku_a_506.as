// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.kgoku_a_506

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

    public dynamic class kgoku_a_506 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var continuePlaying:*;
        public var handled:*;
        public var restart:*;

        public function kgoku_a_506()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 4, this.frame5, 6, this.frame7, 8, this.frame9, 10, this.frame11, 12, this.frame13, 14, this.frame15, 15, this.frame16);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.continuePlaying = false;
                this.handled = false;
                this.restart = false;
                this.self.refreshAttackID();
                this.self.playAttackSound(1);
            };
        }

        internal function frame3():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame5():*
        {
            this.continuePlaying = false;
            this.handled = false;
            this.self.refreshAttackID();
            this.self.playAttackSound(2);
        }

        internal function frame7():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame9():*
        {
            this.continuePlaying = false;
            this.handled = false;
            this.self.refreshAttackID();
            this.self.playAttackSound(3);
        }

        internal function frame11():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame13():*
        {
            this.continuePlaying = false;
            this.handled = false;
            this.self.refreshAttackID();
            this.self.playAttackSound(2);
        }

        internal function frame15():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame16():*
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
                }
                else
                {
                    this.gotoAndPlay("again");
                };
            };
        }


    }
}//package goku_fla

