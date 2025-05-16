// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//quickAttackAfterImage

package 
{
    import flash.display.MovieClip;

    public dynamic class quickAttackAfterImage extends MovieClip 
    {

        public function quickAttackAfterImage()
        {
            addFrameScript(9, this.frame10);
        }

        internal function frame10():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

