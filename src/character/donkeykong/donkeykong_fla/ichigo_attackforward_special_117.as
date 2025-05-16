// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.ichigo_attackforward_special_117

package donkeykong_fla
{
    import flash.display.MovieClip;
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

    public dynamic class ichigo_attackforward_special_117 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var continuePlaying:Boolean;
        public var handled:Boolean;
        public var restart:Boolean;

        public function ichigo_attackforward_special_117()
        {
            addFrameScript(0, this.frame1, 9, this.frame10, 13, this.frame14, 14, this.frame15, 18, this.frame19, 21, this.frame22, 22, this.frame23, 48, this.frame49);
        }

        internal function frame1():*
        {
            this.continuePlaying = false;
            this.handled = true;
            this.restart = false;
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).playVoiceSound(1);
            };
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).playAttackSound(1);
            };
        }

        internal function frame10():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame14():*
        {
            if (((!(this.continuePlaying == true)) && (!(this.restart))))
            {
                if (((!(root == null)) && (!(parent == null))))
                {
                    MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).endAttack();
                };
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
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).modifyAttackID();
            };
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).playVoiceSound(2);
            };
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).playAttackSound(2);
            };
        }

        internal function frame19():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame22():*
        {
            if (((!(this.continuePlaying == true)) && (!(this.restart))))
            {
                if (((!(root == null)) && (!(parent == null))))
                {
                    MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).endAttack();
                };
            }
            else
            {
                if (this.restart)
                {
                    gotoAndPlay("begin");
                };
            };
        }

        internal function frame23():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).modifyAttackID();
            };
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).playVoiceSound(3);
            };
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).playAttackSound(1);
            };
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).modifyMagnet(false);
            };
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).modifyAttackPower(1400);
            };
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).modifyAttackDirection(30);
            };
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).modifyAttackDamage(6);
            };
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).modifyHitLag(0.9);
            };
        }

        internal function frame49():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).endAttack();
            };
        }


    }
}//package donkeykong_fla

