// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.BMWin_16

package blackmage_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class BMWin_16 extends MovieClip 
    {

        public var self:*;
        public var whichWin:*;
        public var winString:*;

        public function BMWin_16()
        {
            addFrameScript(0, this.frame1, 89, this.frame90, 173, this.frame174, 0x0101, this.frame258, 340, this.frame341);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (((parent) && (SSF2API.isReady())))
            {
                this.whichWin = 0;
                this.winString = "win";
                if (SSF2API != null)
                {
                    this.whichWin = (Math.floor((SSF2API.random() * 4)) + 1);
                };
                this.winString = (this.winString + this.whichWin);
                this.gotoAndPlay(this.winString);
            };
        }

        internal function frame90():*
        {
            gotoAndPlay("loop1");
        }

        internal function frame174():*
        {
            this.gotoAndPlay("loop2");
        }

        internal function frame258():*
        {
            this.gotoAndPlay("loop3");
        }

        internal function frame341():*
        {
            this.gotoAndPlay("loop4");
        }


    }
}//package blackmage_fla

