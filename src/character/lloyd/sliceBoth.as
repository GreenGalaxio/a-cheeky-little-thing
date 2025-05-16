// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//sliceBoth

package 
{
    import flash.display.MovieClip;

    public dynamic class sliceBoth extends MovieClip 
    {

        public function sliceBoth()
        {
            addFrameScript(6, this.frame7);
        }

        internal function frame7():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

