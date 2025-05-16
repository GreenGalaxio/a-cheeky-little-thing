// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//yoshi_fla.Yoshi_upthrow_51

package yoshi_fla
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

    public dynamic class Yoshi_upthrow_51 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var opponent:*;
        public var scale:*;

        public function Yoshi_upthrow_51()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 4, this.frame5, 10, this.frame11);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.opponent = null;
            this.scale = null;
            if (((this.self) && (SSF2API.isReady())))
            {
                this.opponent = this.self.getGrabbedOpponent();
                if (this.opponent.getSizeStatus() == -1)
                {
                    this.scale = 0.5;
                }
                else
                {
                    if (this.opponent.getSizeStatus() == 0)
                    {
                        this.scale = 1;
                    }
                    else
                    {
                        if (this.opponent.getSizeStatus() == 1)
                        {
                            this.scale = 2;
                        };
                    };
                };
            };
        }

        internal function frame3():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
            this.self.getGrabbedOpponent().getMC().visible = true;
            this.self.getGrabbedOpponent().setScale((0.2 * this.scale), (0.2 * this.scale));
        }

        internal function frame4():*
        {
            this.self.getGrabbedOpponent().setScale((0.75 * this.scale), (0.75 * this.scale));
        }

        internal function frame5():*
        {
            this.self.getGrabbedOpponent().setScale((1 * this.scale), (1 * this.scale));
            SSF2API.shakeCamera(9);
        }

        internal function frame11():*
        {
            this.self.endAttack();
        }


    }
}//package yoshi_fla

