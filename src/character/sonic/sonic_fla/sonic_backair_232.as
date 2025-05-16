// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_backair_232

package sonic_fla
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

    public dynamic class sonic_backair_232 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var playsound:Number;
        public var audio:Number;

        public function sonic_backair_232()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 16, this.frame17, 18, this.frame19);
        }

        internal function frame1():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).modifyDisableOnGroundLand(false);
            };
            if (((!(root == null)) && (!(parent == null))))
            {
                this.playsound = MovieClip(root).stageData.random();
            };
            this.audio = MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).getGlobalVariable("audio");
        }

        internal function frame4():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).modifyDisableOnGroundLand(true);
            };
        }

        internal function frame5():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).playAttackSound(1);
            };
            if ((((this.playsound > 0.2) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
            {
                if (((!(root == null)) && (!(parent == null))))
                {
                    MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).playVoiceSound(1);
                };
                if (((!(root == null)) && (!(parent == null))))
                {
                    MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).setGlobalVariable("audio", 1);
                };
            };
            if ((((this.playsound > 0.4) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
            {
                if (((!(root == null)) && (!(parent == null))))
                {
                    MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).playVoiceSound(2);
                };
                if (((!(root == null)) && (!(parent == null))))
                {
                    MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).setGlobalVariable("audio", 2);
                };
            };
            if ((((this.playsound > 0.6) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
            {
                if (((!(root == null)) && (!(parent == null))))
                {
                    MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).playVoiceSound(3);
                };
                if (((!(root == null)) && (!(parent == null))))
                {
                    MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).setGlobalVariable("audio", 3);
                };
            };
            if ((((this.playsound > 0.8) && (this.playsound <= 1)) && (!(this.audio == 4))))
            {
                if (((!(root == null)) && (!(parent == null))))
                {
                    MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).playVoiceSound(4);
                };
                if (((!(root == null)) && (!(parent == null))))
                {
                    MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).setGlobalVariable("audio", 4);
                };
            };
        }

        internal function frame17():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).modifyDisableOnGroundLand(false);
            };
        }

        internal function frame19():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).endAttack();
            };
        }


    }
}//package sonic_fla

